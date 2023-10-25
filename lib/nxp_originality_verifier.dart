library nxp_originality_verifier;

import 'dart:typed_data';
import 'package:ecdsa/ecdsa.dart' as ecdsa show Signature, verify;
import 'package:elliptic/elliptic.dart' show PublicKey, getSecp128r1;

final knownPublicKeys = [
  "04494e1a386d3d3cfe3dc10e5de68a499b1c202db5b132393e89ed19fe5be8bc61",
  "044f6d3f294dea5737f0f46ffee88a356eed95695dd7e0c27a591e6f6f65962baf",
  "046f70ac557f5461ce5052c8e4a7838c11c7a236797e8a0730a101837c004039c2",
  "048878a2a2d3eec336b4f261a082bd71f9be11c4e2e896648b32efa59cea6e59f0",
  "0490933bdcd6e99b4e255e3da55389a827564e11718e017292faf23226a96614b8",
  "04a748b6a632fbee2c0897702b33bea1c074998e17b84aca04ff267e5d2c91f6dc"
];

class OriginalityVerifier {
  final List<PublicKey> _publicKeys;

  OriginalityVerifier([List<String>? publicKeys])
      : _publicKeys = (publicKeys ?? knownPublicKeys)
            .map((key) => PublicKey.fromHex(getSecp128r1(), key))
            .toList();

  String _bytesToHex(Uint8List bytes) {
    return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }

  bool verify(Uint8List tagId, Uint8List signature) {
    final R = BigInt.parse(_bytesToHex(signature.sublist(0, 16)), radix: 16);
    final S = BigInt.parse(_bytesToHex(signature.sublist(16)), radix: 16);

    return _publicKeys.any((publicKey) =>
        ecdsa.verify(publicKey, tagId, ecdsa.Signature.fromRS(R, S)));
  }
}

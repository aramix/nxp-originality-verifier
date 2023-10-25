library nxp_originality_verifier;

import 'dart:typed_data';
import 'package:ecdsa/ecdsa.dart' as ecdsa show Signature, verify;
import 'package:elliptic/elliptic.dart' show PublicKey, getSecp128r1;
import './known_public_keys.dart';

class OriginalityVerifier {
  final List<PublicKey> _publicKeys;

  OriginalityVerifier([List<String>? publicKeys])
      : _publicKeys = (publicKeys ?? knownPublicKeys)
            .map((key) => PublicKey.fromHex(getSecp128r1(), key))
            .toList();

  String _bytesToHex(Uint8List bytes) {
    return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
  }

  bool verifyOriginality(Uint8List tagId, Uint8List signature) {
    final R = BigInt.parse(_bytesToHex(signature.sublist(0, 16)), radix: 16);
    final S = BigInt.parse(_bytesToHex(signature.sublist(16)), radix: 16);

    return _publicKeys.any((publicKey) =>
        ecdsa.verify(publicKey, tagId, ecdsa.Signature.fromRS(R, S)));
  }
}

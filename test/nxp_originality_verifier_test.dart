import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

void main() {
  // test('check for originality against known public keys', () {
  //   final verifier = OriginalityVerifier();
  //   expect(
  //       verifier.verifyOriginality(
  //           Uint8List.fromList('04AB87F2CA1190'.codeUnits),
  //           Uint8List.fromList(
  //               '67B1750BCCEB1174F9A33BF20E0226551A6366939B31F949848C3C087350FA90'
  //                   .codeUnits)),
  //       true);
  // });
  test('check for originality against a list of given public keys', () {
    final verifier = OriginalityVerifier(
        ['04494e1a386d3d3cfe3dc10e5de68a499b1c202db5b132393e89ed19fe5be8bc61']);
    expect(
        verifier.verifyOriginality(
            Uint8List.fromList('04A8868A707381'.codeUnits),
            Uint8List.fromList(
                'E81C0E7AD6459F8632691EC6E9E98BD0B8A7DAEF4BF34EA73303DB2DE7E09E94'
                    .codeUnits)),
        true);
  });
}

Flutter package to veryify NXP tag originality signature against known or provided list of public keys

## Features

Check NTAG

## Usage

```dart
final verifier = OriginalityVerifier();
verifier.verifyOriginality(
        Uint8List.fromList('04A8868A707381'.codeUnits),
        Uint8List.fromList(
            'E81C0E7AD6459F8632691EC6E9E98BD0B8A7DAEF4BF34EA73303DB2DE7E09E94'
                .codeUnits));
```

Or specify your own (given by your manufacturer) list of keys

```dart
final verifier = OriginalityVerifier(
        ['04494e1a386d3d3cfe3dc10e5de68a499b1c202db5b132393e89ed19fe5be8bc61']);
verifier.verifyOriginality(
        Uint8List.fromList('04A8868A707381'.codeUnits),
        Uint8List.fromList(
            'E81C0E7AD6459F8632691EC6E9E98BD0B8A7DAEF4BF34EA73303DB2DE7E09E94'
                .codeUnits));
```

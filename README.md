Flutter package to veryify NXP tag originality signature against known or provided list of public keys

## Features

Verifies originality of NTAG, Mifare UL or MIFARE UL EV1 tags

## Usage

```dart
OriginalityVerifier().verify(
        Uint8List.fromList([4, 171, 135, 242, 202, 17, 144]),
        Uint8List.fromList(
            [103, 177, 117, 11, 204, 235, 17, 116, 249, 163, 59, 242, 14, 2, 38, 85, 26, 99, 102, 147, 155, 49, 249, 73, 132, 140, 60, 8, 115, 80, 250, 144]));
```

Or specify your own (given by your manufacturer) list of keys

```dart
OriginalityVerifier(
        ['04494e1a386d3d3cfe3dc10e5de68a499b1c202db5b132393e89ed19fe5be8bc61'])verify(
        Uint8List.fromList([4, 171, 135, 242, 202, 17, 144]),
        Uint8List.fromList(
            [103, 177, 117, 11, 204, 235, 17, 116, 249, 163, 59, 242, 14, 2, 38, 85, 26, 99, 102, 147, 155, 49, 249, 73, 132, 140, 60, 8, 115, 80, 250, 144]));
```

## TODO

* Error handling

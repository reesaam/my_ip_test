enum LocalStorageKeys {
  lastIp,
}

enum HiveTypeIndexes {
  ipModel(value: 1),
  lastIpModel(value: 2),
  other(value: 99);

  const HiveTypeIndexes({required this.value});
  final int value;
}
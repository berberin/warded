abstract class SecureLocalStorageClientInterface {
  void close({bool force = false});

  Future getValue(String key);
  Future setValue(String key, dynamic value);
}

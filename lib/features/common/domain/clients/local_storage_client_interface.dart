abstract class LocalStorageClientInterface {
  Future<void> init();
  void close({bool force = false});
  Future getBox(String boxName);
  Future getValue(String boxName, String key);
  Future setValue(String boxName, String? key, dynamic value);
}

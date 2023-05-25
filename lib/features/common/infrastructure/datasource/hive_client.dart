import 'package:hive_flutter/adapters.dart';
import 'package:warded/features/common/domain/clients/local_storage_client_interface.dart';

class HiveClient implements LocalStorageClientInterface {
  Map<String, Box> boxes = <String, Box>{};

  @override
  Future<void> init() {
    return Hive.initFlutter();
  }

  void registerAdapter<T>(TypeAdapter<T> adapter) {
    Hive.registerAdapter<T>(adapter);
  }

  @override
  void close({bool force = false}) {
    Hive.close();
  }

  @override
  Future<Box> getBox(String boxName) async {
    if (boxes.containsKey(boxName)) {
      return boxes[boxName]!;
    }
    var box = await Hive.openBox(boxName);
    boxes[boxName] = box;
    return box;
  }

  @override
  Future getValue(String boxName, String key) async {
    var box = await getBox(boxName);
    return box.get(key);
  }

  @override
  Future setValue(String boxName, String? key, value) async {
    var box = await getBox(boxName);
    if (key == null) {
      return box.add(value);
    }
    return box.put(key, value);
  }
}

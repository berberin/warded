import 'package:hive_flutter/adapters.dart';
import 'package:warded/features/common/domain/clients/local_storage_client_interface.dart';
import 'package:warded/features/common/infrastructure/datasource/hive_client.dart';
import 'package:warded/features/tormentor/domain/entities/record.dart';
import 'package:warded/utils/date_utils.dart';

class LocalRecordDs {
  LocalStorageClientInterface client;
  LocalRecordDs(this.client) {
    init();
  }

  void init() {
    if (client is HiveClient) {
      (client as HiveClient).registerAdapter<WatchRecord>(WatchRecordAdapter());
    }
  }

  Future<void> storeRecord(WatchRecord record) async {
    return client.setValue(
        RecordBox, DatetimeUtils.getDateString(record.time!), record);
  }

  Future<List<WatchRecord>> getAllRecord() async {
    var values = (await client.getBox(RecordBox) as Box)
        .values
        .whereType<WatchRecord>()
        .toList()
      ..sort((a, b) {
        return a.time!.compareTo(b.time!);
      });
    return values;
  }
}

const RecordBox = 'records';

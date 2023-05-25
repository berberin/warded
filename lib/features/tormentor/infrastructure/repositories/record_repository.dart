import 'package:warded/features/tormentor/domain/entities/record.dart';
import 'package:warded/features/tormentor/domain/repositories/record_repository_interface.dart';
import 'package:warded/features/tormentor/infrastructure/datasources/local_record_ds.dart';

class RecordRepository implements RecordRepositoryInterface {
  LocalRecordDs localRecordDs;
  RecordRepository(this.localRecordDs);

  @override
  Future<List<WatchRecord>> getAllRecord() {
    return localRecordDs.getAllRecord();
  }

  @override
  Future<void> storeRecord(WatchRecord record) {
    return localRecordDs.storeRecord(record);
  }
}

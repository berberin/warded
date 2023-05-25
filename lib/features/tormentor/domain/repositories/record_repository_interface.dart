import 'package:warded/features/tormentor/domain/entities/record.dart';

abstract class RecordRepositoryInterface {
  Future<void> storeRecord(WatchRecord record);
  Future<List<WatchRecord>> getAllRecord();
}

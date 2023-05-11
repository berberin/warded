import 'package:fpdart/fpdart.dart';
import 'package:yelloweye/features/tormentor/domain/entities/record.dart';

abstract class RecordRepositoryInterface {
  Future<void> storeRecord(WatchRecord record);

  Future<Either<Failure, List<WatchRecord>>> getAllRecord();
}

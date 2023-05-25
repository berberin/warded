import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:warded/features/common/infrastructure/datasource/hive_client_id.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
@JsonSerializable(
  fieldRename: FieldRename.snake,
  includeIfNull: true,
)
@HiveType(typeId: HiveTypeId.record)
class WatchRecord with _$WatchRecord {
  factory WatchRecord({
    @HiveField(0) DateTime? time,
    @HiveField(1) bool? marked,
  }) = _Record;
}

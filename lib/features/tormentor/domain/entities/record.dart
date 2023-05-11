import 'package:freezed_annotation/freezed_annotation.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class WatchRecord {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WatchRecord({
    required DateTime time,
  }) = _Record;
}

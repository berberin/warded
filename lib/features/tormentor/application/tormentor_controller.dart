import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:warded/features/tormentor/application/state/tormentor_state.dart';
import 'package:warded/features/tormentor/domain/entities/record.dart';
import 'package:warded/features/tormentor/provider.dart';

part 'tormentor_controller.g.dart';

@riverpod
class TormentorController extends _$TormentorController {
  String quote = '';
  String assetString = '';
  @override
  Future<TormentorState> build() async {
    return await getNewState();
  }

  void addPositiveRecord() async {
    final recordRepository = ref.read(recordRepositoryProvider);
    recordRepository
        .storeRecord(WatchRecord(time: DateTime.now(), marked: false));
    ref.refresh(tormentorControllerProvider);
  }

  void addNegativeRecord() async {
    final recordRepository = ref.read(recordRepositoryProvider);
    recordRepository
        .storeRecord(WatchRecord(time: DateTime.now(), marked: true));
    ref.refresh(tormentorControllerProvider);
  }

  Future<TormentorState> getNewState() async {
    final recordRepository = ref.read(recordRepositoryProvider);
    final quoteRepository = ref.read(quoteRepositoryProvider);

    if (quote == '' || assetString == '') {
      quote = await quoteRepository.getOneQuote();
      assetString = await quoteRepository.getOneAsset();
    }

    List<WatchRecord> records = await recordRepository.getAllRecord();
    if (records.isNotEmpty) {
      double rate = 1 -
          records.where((element) => element.marked ?? true).length /
              (DateTime.now().difference(records.first.time!).inDays + 1);
      int count = 0;
      bool endList = true;
      for (var r in records.reversed) {
        if ((r.marked ?? false)) {
          count = DateTime.now().difference(r.time!).inDays;
          endList = false;
          break;
        }
      }
      if (endList) {
        count = DateTime.now().difference(records[0].time!).inDays;
      }

      return TormentorState(
        rate,
        count,
        quote,
        assetString,
      );
    } else {
      return TormentorState(
        0,
        0,
        quote,
        assetString,
      );
    }
  }
}

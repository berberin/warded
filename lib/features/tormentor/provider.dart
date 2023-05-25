import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:warded/config/dependency.dart';
import 'package:warded/features/tormentor/infrastructure/repositories/quote_repository.dart';
import 'package:warded/features/tormentor/infrastructure/repositories/record_repository.dart';

part 'provider.g.dart';

@riverpod
RecordRepository recordRepository(RecordRepositoryRef ref) {
  final localRecordDs = ref.watch(DependencyManager.localRecordDsProvider);
  return RecordRepository(localRecordDs);
}

@riverpod
QuoteRepository quoteRepository(QuoteRepositoryRef ref) {
  final localQuoteDs = ref.watch(DependencyManager.localQuoteDsProvider);
  return QuoteRepository(localQuoteDs);
}

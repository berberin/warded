import 'dart:math';

import 'package:warded/features/tormentor/domain/repositories/quote_repository_interface.dart';
import 'package:warded/features/tormentor/infrastructure/datasources/local_quote_material_ds.dart';

class QuoteRepository implements QuoteRepositoryInterface {
  LocalQuoteMaterialDs localQuoteMaterialDs;
  QuoteRepository(this.localQuoteMaterialDs);

  @override
  Future<String> getOneAsset() async {
    List<String> assets = await localQuoteMaterialDs.getAllAssetString();
    return assets[Random().nextInt(assets.length)];
  }

  @override
  Future<String> getOneQuote() async {
    List<String> quotes = await localQuoteMaterialDs.getAllQuotes();
    return quotes[Random().nextInt(quotes.length)];
  }

  @override
  Future<void> storeQuote(String quote) {
    return localQuoteMaterialDs.storeQuote(quote);
  }
}

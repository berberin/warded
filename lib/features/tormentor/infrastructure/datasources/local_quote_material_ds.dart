import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:warded/features/common/domain/clients/local_storage_client_interface.dart';

class LocalQuoteMaterialDs {
  LocalStorageClientInterface client;
  LocalQuoteMaterialDs(this.client) {
    init();
  }

  Future init() async {
    final box = await client.getBox(QuoteBox);
    if (box.values.length == 0) {
      final dataString = await rootBundle.loadString('assets/data/q.csv');
      Iterable<String> listQuotes = LineSplitter.split(dataString);
      for (var q in listQuotes) {
        storeQuote(q);
      }
    }
  }

  Future<void> storeQuote(String quote) async {
    return client.setValue(QuoteBox, null, quote);
  }

  Future<List<String>> getAllAssetString() async {
    final manifestContent = await rootBundle.loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    return manifestMap.keys
        .where((element) => element.contains('camp/'))
        .toList();
  }

  Future<List<String>> getAllQuotes() async {
    var values =
        (await client.getBox(QuoteBox)).values.whereType<String>().toList();
    return values;
  }
}

const QuoteBox = 'quotes';

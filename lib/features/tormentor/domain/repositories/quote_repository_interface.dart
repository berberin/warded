abstract class QuoteRepositoryInterface {
  Future<void> storeQuote(String quote);
  Future<String> getOneQuote();
  Future<String> getOneAsset();
}

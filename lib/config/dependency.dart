import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warded/features/common/infrastructure/datasource/hive_client.dart';
import 'package:warded/features/tormentor/infrastructure/datasources/local_quote_material_ds.dart';
import 'package:warded/features/tormentor/infrastructure/datasources/local_record_ds.dart';

class DependencyManager {
  DependencyManager._();

  static final sharedPreferencesProvider =
      FutureProvider((ref) => SharedPreferences.getInstance());

  static final hiveClientProvider = Provider((ref) => HiveClient());
  static final localRecordDsProvider =
      Provider((ref) => LocalRecordDs(ref.read(hiveClientProvider)));
  static final localQuoteDsProvider =
      Provider((ref) => LocalQuoteMaterialDs(ref.read(hiveClientProvider)));

  static Future<void> initializeProviders(ProviderContainer container) async {
    ///
    /// Infra
    ///
    container.read(hiveClientProvider);
    await container.read(hiveClientProvider).init();

    await container.read(sharedPreferencesProvider.future);
  }
}

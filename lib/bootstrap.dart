import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warded/config/dependency.dart';

import 'flavors.dart';

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final configFile = await rootBundle.loadString(F.envFileName);
  // final env = Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

  final container = ProviderContainer(
    overrides: [],
    observers: [if (F.appFlavor == Flavor.local) _Logger()],
  );
  await DependencyManager.initializeProviders(container);
  return container;
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint(
      '''
      {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
      }''',
    );
  }
}

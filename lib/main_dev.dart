import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warded/app.dart';

import 'bootstrap.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.dev;
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: const App(),
    ),
  );
}

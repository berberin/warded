enum Flavor {
  local,
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;
  static String get title => '${appFlavor?.name}';
  static String get envFileName => '${appFlavor?.name}.config.json';
}

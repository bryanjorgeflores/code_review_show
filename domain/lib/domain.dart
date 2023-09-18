library domain;

import 'package:domain/di/locator.dart';
export './src/main/main.dart';
export './src/commons/commons.dart';

class Domain {
  static void init(Map<String, String> env) {
    // setup required locators for domain module
    configureDependencies(env);
  }
}

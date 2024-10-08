import 'package:get_it/get_it.dart';

import 'core_injection.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  registerCoreDependencies(getIt);
}

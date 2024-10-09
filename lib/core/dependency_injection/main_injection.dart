import 'package:get_it/get_it.dart';

import 'all_books_injection.dart';
import 'core_injection.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await registerCoreDependencies(getIt);

  await registerAllBooksDependencies(getIt);
}

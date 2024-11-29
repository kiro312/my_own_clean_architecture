import 'package:get_it/get_it.dart';
import 'package:my_own_clean_architecture/core/dependency_injection/all_authors_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_books_injection.dart';
import 'core_injection.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies(String baseUrl) async {
  await registerCoreDependencies(getIt, baseUrl);
  await getIt.isReady<SharedPreferences>();

  await registerAllBooksDependencies(getIt);

  await registerAllAuthorsDependencies(getIt);
}

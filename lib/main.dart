import 'package:flutter/material.dart';

import 'core/dependency_injection/main_injection.dart';
import 'features/all_authors/business/state/all_authors_provider.dart';
import 'features/all_books/business/state/all_books_provider.dart';
import 'features/home/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies(
    // Change the base URL to your own API URL
    'https://api.example.com',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AllBooksProvider()),
        ChangeNotifierProvider(create: (context) => AllAuthorsProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

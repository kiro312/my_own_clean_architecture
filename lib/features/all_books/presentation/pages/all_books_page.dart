import 'package:flutter/material.dart';
import 'package:my_own_clean_architecture/features/all_books/business/state/all_books_state_manager.dart';
import 'package:my_own_clean_architecture/features/all_books/presentation/widgets/books_list_widget.dart';

import '../../../../core/state/app_states.dart';

class AllBooksPage extends StatefulWidget {
  const AllBooksPage({super.key});

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AllBooksStateManager.fetchAllBooksFirstTime(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          switch (AllBooksStateManager.getAllBooksState(context)) {
            case AppStates.loading:
              return const Center(child: CircularProgressIndicator());
            case AppStates.success:
              return const BooksListWidget();
            case AppStates.failure:
              return Center(child: Text(AllBooksStateManager.getFailureMessage(context)));
            case AppStates.empty:
              return const Center(child: Text('No books available'));
            case AppStates.idle:
              return const Center(child: Text('No books available'));
          }
        },
      ),
    );
  }
}

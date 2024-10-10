import 'package:flutter/material.dart';

import '../../../../core/state/app_states.dart';
import '../../business/state/all_authors_state_manager.dart';
import '../widgets/authors_list_widget.dart';

class AllAuthorsPage extends StatefulWidget {
  const AllAuthorsPage({super.key});

  @override
  State<AllAuthorsPage> createState() => _AllAuthorsPageState();
}

class _AllAuthorsPageState extends State<AllAuthorsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AllAuthorsStateManager.fetchAllAuthorsFirstTime(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          switch (AllAuthorsStateManager.getAllAuthorsState(context)) {
            case AppStates.loading:
              return const Center(child: CircularProgressIndicator());
            case AppStates.success:
              return const AuthorsListWidget();
            case AppStates.failure:
              return Center(child: Text(AllAuthorsStateManager.getFailureMessage(context)));
            case AppStates.empty:
              return const Center(child: Text('No Authors available'));
            case AppStates.idle:
              return const Center(child: Text('No Authors available'));
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AllAuthorsPage extends StatefulWidget {
  const AllAuthorsPage({super.key});

  @override
  State<AllAuthorsPage> createState() => _AllAuthorsPageState();
}

class _AllAuthorsPageState extends State<AllAuthorsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('All Authors Page'),
      ),
    );
  }
}

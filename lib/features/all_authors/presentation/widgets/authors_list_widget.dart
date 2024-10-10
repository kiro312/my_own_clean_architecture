import 'package:flutter/material.dart';
import 'package:my_own_clean_architecture/features/all_authors/business/Entity/author_entity.dart';

import '../../business/state/all_authors_state_manager.dart';

class AuthorsListWidget extends StatelessWidget {
  const AuthorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: AllAuthorsStateManager.getAllAuthorsList(context).length,
      itemBuilder: (context, index) {
        final AuthorEntity author =
            AllAuthorsStateManager.getAllAuthorsList(context)[index];
        return SingleAuthorWidget(
          author: author,
        );
      },
    );
  }
}

class SingleAuthorWidget extends StatelessWidget {
  final AuthorEntity author;
  const SingleAuthorWidget({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            author.authorName!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            author.authorBio!,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

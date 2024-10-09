import 'dart:convert';

import 'package:my_own_clean_architecture/core/helpers/cache_helper.dart';

import '../../models/all_books_response.dart';

class AllBooksLocalApi {
  final CacheHelper cacheHelper;
  final String _allBooksKey = 'all_books';

  AllBooksLocalApi(this.cacheHelper);

  Future<void> cacheAllBooks(AllBooksResponse allBooksResponse) async {
    cacheHelper.saveData(
      key: _allBooksKey,
      value: json.encode(
        allBooksResponse.toJson(),
      ),
    );
  }

  Future<AllBooksResponse> getLastAllBooks() async {
    final allBooksJson = await cacheHelper.getData(_allBooksKey);
    return AllBooksResponse.fromJson(json.decode(allBooksJson!));
  }
}

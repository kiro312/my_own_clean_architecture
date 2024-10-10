import 'dart:convert';

import '../../../../../core/helpers/cache_helper.dart';
import '../../models/all_authors_response.dart';

class AllAuthorsLocalApi {
  final CacheHelper cacheHelper;
  final String _allAuthorsKey = 'all_authors';

  AllAuthorsLocalApi(this.cacheHelper);

  Future<void> cacheAllAuthors(AllAuthorsResponse allAuthorsResponse) async {
    cacheHelper.saveData(
      key: _allAuthorsKey,
      value: json.encode(
        allAuthorsResponse.toJson(),
      ),
    );
  }

  Future<AllAuthorsResponse> getLastAllAuthors() async {
    final allAuthorsJson = await cacheHelper.getData(_allAuthorsKey);
    return AllAuthorsResponse.fromJson(json.decode(allAuthorsJson!));
  }
}
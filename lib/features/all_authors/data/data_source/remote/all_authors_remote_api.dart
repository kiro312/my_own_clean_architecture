import 'package:dio/dio.dart';
import 'package:my_own_clean_architecture/features/all_authors/data/models/all_authors_response.dart';

import 'package:retrofit/retrofit.dart';

part 'all_authors_remote_api.g.dart';

@RestApi()
abstract class AllAuthorsRemoteApi {
  factory AllAuthorsRemoteApi(Dio dio, {String? baseUrl}) =
      _AllAuthorsRemoteApi;

  @GET('authors')
  Future<AllAuthorsResponse> getAllAuthors();
}

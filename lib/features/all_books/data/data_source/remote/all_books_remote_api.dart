import 'package:dio/dio.dart';

import '../../models/all_books_response.dart';
import 'package:retrofit/retrofit.dart';

part 'all_books_remote_api.g.dart';

@RestApi()
abstract class AllBooksRemoteApi {
  factory AllBooksRemoteApi(Dio dio, {String? baseUrl}) = _AllBooksRemoteApi;

  @GET('books')
  Future<AllBooksResponse> getAllBooks();
}

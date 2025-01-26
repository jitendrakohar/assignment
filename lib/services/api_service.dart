import 'package:assignment1/model/post_model.dart';
import 'package:assignment1/services/ParseErrorLogger.dart';
import 'package:assignment1/utils/ToastUtils.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://stagingauth.desidime.com/v4/home/")
abstract class ApiService {
  factory ApiService(
    Dio dio, {
    String baseUrl,
  }) = _ApiService;

  @GET("new")
  Future<List<PostModel>> getTopPosts(
    @Query("per_page") int perPage,
    @Query("page") int page,
    @Query("fields") String fields, {
    @Header("X-Desidime-Client")
    String clientHeader = "08b4260e5585f282d1bd9d085e743fd9",
  });

  @GET("discussed")
  Future<List<PostModel>> getPopularPosts(
    @Query("per_page") int perPage,
    @Query("page") int page,
    @Query("fields") String fields, {
    @Header("X-Desidime-Client")
    String clientHeader = "08b4260e5585f282d1bd9d085e743fd9",
  });

  @GET("discussed")
  Future<List<PostModel>> getFeaturedPosts(
    @Query("per_page") int perPage,
    @Query("page") int page,
    @Query("fields") String fields, {
    @Header("X-Desidime-Client")
    String clientHeader = "08b4260e5585f282d1bd9d085e743fd9",
  });
}

/*
// 1. Top :- (GET)
http://stagingauth.desidime.com/v4/home/new?per_page=10&page=1&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store{name}

// 2. Popular :- (GET)
http://stagingauth.desidime.com/v4/home/discussed?per_page=10&page=1&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store{name}

// 3. Featured:- (GET)
http://stagingauth.desidime.com/v4/home/discussed?per_page=10&page=1&fields=id,created_at,created_at_in_millis,image_medium,comments_count,store{name}


*/

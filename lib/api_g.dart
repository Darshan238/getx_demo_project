
import 'package:getx_project_demo/model/detail_api.dart';
import 'package:getx_project_demo/model/home_api.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'api_g.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  @GET("/todos")
  Future<List<ApiModel>> getUser();

  @GET("/comments?postId={id}")
  Future<List<DetailApi>> getDetailUser(@Path("id") int id);
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_auth.g.dart';

@lazySingleton
@RestApi()
abstract class ApiAuth {
  @factoryMethod
  factory ApiAuth(Dio dio) = _ApiAuth;
}

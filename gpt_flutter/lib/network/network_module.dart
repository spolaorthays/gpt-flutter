import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://api.openai.com/v1/';

  @Named('PrettyLogger')
  Interceptor providePrettyLogger() => PrettyDioLogger();

  @singleton
  Dio provideDio(
    @Named('BaseUrl') String baseUrl,
    @Named('PrettyLogger') Interceptor prettyLogger,
  ) =>
      Dio(
        BaseOptions(baseUrl: baseUrl),
      )..interceptors.add(prettyLogger);

  //@Named('Authentication')
  //Interceptor provideAuthenticationInterceptor() =>
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'http://ip:port/';
  //String get baseUrl => 'https://api.openai.com/v1/';

  @Named('PrettyLogger')
  Interceptor providePrettyLogger() => PrettyDioLogger();

  //@Named('AuthInterceptor')
  //Interceptor provideAuthenticationInterceptor() => AuthInterceptor();

  @singleton
  Dio provideDio(
    @Named('BaseUrl') String baseUrl,
    @Named('PrettyLogger') Interceptor prettyLogger,
  ) =>
      Dio(
        BaseOptions(baseUrl: baseUrl),
      )
        ..interceptors.add(prettyLogger)
        ..interceptors.add(
          InterceptorsWrapper(onRequest: (request, handler) {
            request.headers.addAll(
              {
                'Authorization': 'Bearer token',
                'Content-Type': 'application/json'
              },
            );
            return handler.next(request);
          }, onError: (error, handler) async {
            return handler.reject(error);
          }),
        );
}

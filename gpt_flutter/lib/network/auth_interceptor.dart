import 'package:dio/dio.dart';

class AuthInterceptor implements Interceptor {
  //Não consegui fazer funcionar com o Interceptor apartado
  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer ' + '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';
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

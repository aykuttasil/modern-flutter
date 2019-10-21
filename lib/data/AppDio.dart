import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

class AppDio {
  static Alice _alice = new Alice(showNotification: true);
  static Dio _dio;

  static Dio get() {
    if (_dio == null) {
      BaseOptions options = new BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      _dio = Dio(options)
        ..interceptors.add(LogInterceptor(responseBody: false))
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
          // Do something before request is sent
          return options; //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        }, onResponse: (Response response) {
          // Do something with response data
          return response; // continue
        }, onError: (DioError e) {
          // Do something with response error
          return e; //continue
        }))
        ..interceptors.add(_alice.getDioInterceptor());
    }
    return _dio;
  }

//  static void setupInterceptors() {
//    int maxCharactersPerLine = 200;
//
//    _dio.interceptor.request.onSend = (Options options) {
//      _logger.fine("--> ${options.method} ${options.path}");
//      _logger.fine("Content type: ${options.contentType}");
//      _logger.fine("<-- END HTTP");
//      return options;
//    };
//
//    _dio.interceptor.response.onSuccess = (Response response) {
//      _logger.fine(
//          "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
//      String responseAsString = response.data.toString();
//      if (responseAsString.length > maxCharactersPerLine) {
//        int iterations =
//        (responseAsString.length / maxCharactersPerLine).floor();
//        for (int i = 0; i <= iterations; i++) {
//          int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
//          if (endingIndex > responseAsString.length) {
//            endingIndex = responseAsString.length;
//          }
//          _logger.fine(responseAsString.substring(
//              i * maxCharactersPerLine, endingIndex));
//        }
//      } else {
//        _logger.fine(response.data);
//      }
//      _logger.fine("<-- END HTTP");
//    };
//  }
}

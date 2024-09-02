import 'package:dio/dio.dart';

class DioService {
  DioService() {
    final options = BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/functions',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        "X-Parse-Application-Id": "OamBy1L3kxICFxsDC2C7lK6GjOUd6u8lmrFXnXDx",
        "X-Parse-REST-API-Key": "rEmgSfbKFUoViRLVqVNHui3PaxWZdUTMn2cDErDG",
        "X-Parse-Session-Token": "r:4139033cb0bee3afc5416b97e9a08ea8"
      },
    );
    _dio = Dio(options);
  }

  late Dio _dio;
  Dio get dio => _dio;
}
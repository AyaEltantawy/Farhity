import 'package:untitled3/core/app_storage/app_storage.dart';
import 'package:untitled3/utils/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class DioHelper {
  static const _baseUrl = 'https://alrmoz.com/farhty/public/api/';

  static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;

  static Future<Response<dynamic>> post(String path, bool isAuth,
      {FormData? formData,
      encoding,
      Map<String, dynamic>? body,
      Function(int, int)? onSendProgress}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! ');
    } else {
      Utils.showSnackBar('You are disconnected from the internet');
    }

    dioSingleton.options.headers =
        isAuth ? {'Authorization': 'Bearer ${AppStorage.getToken}'} : null;

    final response = dioSingleton.post(path,
        data: formData ?? FormData.fromMap(body!),
        options: Options(
            requestEncoder: encoding,
            headers: {
              'Authorization': 'Bearer ${AppStorage.getToken}',
              'Accept': 'application/json',
              'Accept-Language':
                  AppStorage.box.read('language') == 'english' ? 'en' : 'ar',
            },
            followRedirects: false,
            contentType: Headers.formUrlEncodedContentType,
            receiveDataWhenStatusError: true,
            sendTimeout: const Duration(seconds: 40),
            validateStatus: (status) {
              return status! < 500;
            }),
        onSendProgress: onSendProgress);
    return response;
  }

  static Future<Response<dynamic>> put(String path, bool isAuth,
      {FormData? formData,
      Map<String, dynamic>? body,
      Function(int, int)? onSendProgress}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! ');
    } else {
      Utils.showSnackBar('You are disconnected from the internet');
    }
    dioSingleton.options.headers =
        isAuth ? {'Authorization': 'Bearer ${AppStorage.getToken}'} : null;
    final response = dioSingleton.put(path,
        data: formData ?? FormData.fromMap(body!),
        options: Options(
            headers: {
              'Authorization': 'Bearer ${AppStorage.getToken}',
              'Accept': 'application/json',
              'Accept-Language':
                  AppStorage.box.read('language') == 'english' ? 'en' : 'ar',
            },
            followRedirects: false,
            receiveDataWhenStatusError: true,
            sendTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
            validateStatus: (status) {
              return status! < 500;
            }),
        onSendProgress: onSendProgress);
    return response;
  }

  static Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? body,
  }) {
    try {
      dioSingleton.options.headers = {
        'Authorization': 'Bearer ${AppStorage.getToken}'
      };
      final response = dioSingleton.delete(
        path,
        data: body,
        options: Options(
            headers: {
              'Authorization': 'Bearer ${AppStorage.getToken}',
              'Accept': 'application/json'
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response<dynamic>>? get(String path, {dynamic body}) async {
    if (AppStorage.isLogged) {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
      } else {
        Utils.showSnackBar('You are disconnected from the internet');
      }
      dioSingleton.options.headers = {
        'Authorization': 'Bearer ${AppStorage.getToken}',
        'Accept': 'application/json',
        'Accept-Language':
            AppStorage.box.read('language') == 'english' ? 'en' : 'ar',
      };
    }
    final response = dioSingleton.get(path,
        queryParameters: body,
        options: Options(
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ));
    dioSingleton.options.headers = null;
    return response;
  }

  static Future<void>? launchURL(url) async {
    if (!await launch(
      url,
    )) throw 'Could not launch $url';
  }
}

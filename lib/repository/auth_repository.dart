// ignore_for_file: strict_raw_type

import 'package:astros_app/config/api.dart';
import 'package:dio/dio.dart';

class UserRepo {
  static Future loginUser(
    String userEmail,
    String userPassword,
    bool isIntegration,
  ) async {
    try {
      final returnData = await dio.post(
        'signin',
        data: {
          'email': userEmail,
          'password': userPassword,
        },
      );

      print(returnData.data);
      return returnData;
    } on DioError catch (e) {
      print(e);
    }
  }
}

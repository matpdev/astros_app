import 'package:astros_app/config/ENV/DEV.dart';
import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: API,
);

Dio dio = Dio(options);

Future<Map> getAddress(String cep) async {
  try {
    final response = await Dio().get('https://viacep.com.br/ws/$cep/json/');
    return response.data as Map;
  } on DioError catch (e) {
    print(e);
    return e.response?.data as Map;
  }
}

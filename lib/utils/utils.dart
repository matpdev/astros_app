import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:intl/intl.dart';

Future<void> saveUserToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'token', value: token);
}

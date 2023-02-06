import 'package:astros_app/globalController/user_controller.dart';
import 'package:astros_app/repository/auth_repository.dart';
import 'package:astros_app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Database? db;
  final userController = Get.put<UserController>(
    UserController(),
  );

  Future<dynamic> openDbUser() async {
    db = await openDatabase(
      'user_db.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        create table user(
          id integer primary key autoincrement,
          email text not null UNIQUE,
          password text not null,
          loggeddate text
        )
        ''');
      },
    );
  }

  Future<dynamic> getUserData() async {
    await openDbUser();
    if (db!.isOpen) {
      final List<Map> userData = await db!.query('user');
      print(userData);
      if (userData.isNotEmpty) {
        return userData[0];
      } else {
        return userData;
      }
    }
  }

  Future<dynamic> setUserdata(String email, String password) async {
    await openDbUser();
    if (db!.isOpen) {
      await db!.insert(
        'user',
        {
          'email': email,
          'password': password,
          'loggeddate': DateTime.now().toString(),
        },
      );
    }
  }

  Future<dynamic> loginUser() async {
    await openDbUser();
    if (db!.isOpen) {
      final List<Map> userData = await db!.query('user');
      if (userData.isNotEmpty) {
        final response = await UserRepo.loginUser(
          userData[0]['email'].toString(),
          userData[0]['password'].toString(),
          false,
        ) as Response;

        if (response.statusCode == 200) {
          await saveUserToken(response.data['jwt'].toString());

          userController.setUserData(
            response.data as Map<String, dynamic>,
          );

          await db!.update('user', {
            'email': userData[0]['email'],
            'password': userData[0]['password'],
            'loggeddate': DateTime.now().toString(),
          });
        }
      } else {
        return userData;
      }
    }
  }

  Future<dynamic> deleteUser() async {
    await openDbUser();
    if (db!.isOpen) {
      await db!.delete('user');
    }
  }
}

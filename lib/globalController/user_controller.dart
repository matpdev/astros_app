import 'package:astros_app/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<UserModel> userdata = UserModel().obs;
  void setUserData(Map<String, dynamic> userData) {
    userdata.value.setData(
      email: userData['email'].toString(),
      firstName: userData['firstName'].toString(),
      token: userData['jwt'].toString(),
      lastName: userData['lastName'].toString(),
      imageIcon: userData['imageIcon'].toString(),
      roleType: int.parse(userData['roleTypeId'].toString()),
    );
  }

  UserModel get getUserdata => userdata.value;
}

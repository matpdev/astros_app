class UserModel {
  UserModel({
    this.email,
    this.firstName,
    this.lastName,
    this.roleType,
    this.imageIcon,
    this.token,
  });
  String? email;
  String? firstName;
  String? lastName;
  int? roleType;
  String? imageIcon;
  String? token;

  void clearData() {
    email = null;
    token = null;
    firstName = null;
    lastName = null;
    roleType = 0;
    imageIcon = null;
  }

  void setData({
    String email = '',
    String token = '',
    String firstName = '',
    String lastName = '',
    int roleType = 0,
    String imageIcon = '',
  }) {
    this.email = email;
    this.token = token;
    this.firstName = firstName;
    this.lastName = lastName;
    this.roleType = roleType;
    this.imageIcon = imageIcon;
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'token': token,
      'firstName': firstName,
      'lastName': lastName,
      'roleType': roleType,
      'imageIcon': imageIcon
    };
  }
}

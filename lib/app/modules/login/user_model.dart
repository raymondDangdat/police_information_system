class User {
  SingleUser? user;
  String? token;

  User({this.user, this.token});

  User.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? SingleUser?.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class SingleUser {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  bool? isActive;
  bool? isStaff;
  String? lastLogin;
  String? avatar;
  String? about;
  String? userType;
  bool? isEmailVerified;

  SingleUser(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.isActive,
      this.isStaff,
      this.lastLogin,
      this.avatar,
      this.about,
      this.userType,
      this.isEmailVerified});

  SingleUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    isStaff = json['is_staff'];
    lastLogin = json['last_login'];
    avatar = json['avatar'];
    about = json['about'];
    userType = json['user_type'];
    isEmailVerified = json['is_email_verified'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['is_active'] = isActive;
    data['is_staff'] = isStaff;
    data['last_login'] = lastLogin;
    data['avatar'] = avatar;
    data['about'] = about;
    data['user_type'] = userType;
    data['is_email_verified'] = isEmailVerified;
    return data;
  }
}

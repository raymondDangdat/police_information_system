import 'package:cloud_firestore/cloud_firestore.dart';

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


class UserModel {
  String? dateRecruited;
  String? email;
  String? gender;
  String? height;
  String? id;
  String? maritalStatus;
  String? name;
  String? phone;
  String? profile;
  String? rank;
  String? station;

  UserModel({
    this.dateRecruited,
    this.email,
    this.gender,
    this.height,
    this.maritalStatus,
    this.name,
    this.id,
    this.profile,
    this.phone,
    this.rank,
    this.station

  });
  UserModel.fromJSON(Map<String, dynamic> jsonMap) {
    dateRecruited = jsonMap['dateRecruited'] != null ? jsonMap['dateRecruited'] : '';
    email = jsonMap['email'] != null ? jsonMap['email'] : '';
    gender = jsonMap['gender'] != null ? jsonMap['gender'] : '';
    height = jsonMap['height'] != null ? jsonMap['height'] : '';
    maritalStatus = jsonMap['maritalStatus'] != null ? jsonMap['maritalStatus'] : '';
    name = jsonMap['name'] != null ? jsonMap['name'] : '';
    id = jsonMap['id'] != null ? jsonMap['id'] : '';
    profile = jsonMap['profile'] != null ? jsonMap['profile'] : '';
    phone = jsonMap['phone'] != null ? jsonMap['phone'] : '';
    rank = jsonMap['rank'] != null ? jsonMap['rank'] : '';
    station = jsonMap['station'] != null ? jsonMap['station'] : '';

  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      dateRecruited : doc.data()!['dateRecruited'] != null ? doc.data()!['dateRecruited'] : '',
      email : doc.data()!['email'] != null ? doc.data()!['email'] : '',
      gender: doc.data()!['gender'] != null ? doc.data()!['gender'] : '',
      height: doc.data()!['height'] != null ? doc.data()!['height'] : '',
      maritalStatus: doc.data()!['maritalStatus'] != null ? doc.data()!['maritalStatus'] : '',
      name: doc.data()!['name'] != null ? doc.data()!['name'] : '',
      id: doc.data()!['id'] != null ? doc.data()!['id'] : '',
      profile: doc.data()!['profile'] != null ? doc.data()!['profile'] : '',
      phone: doc.data()!['phone'] != null ? doc.data()!['phone'] : '',
      rank: doc.data()!['rank'] != null ? doc.data()!['rank'] : '',
      station: doc.data()!['station'] != null ? doc.data()!['station'] : '',
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['dateRecruited'] = dateRecruited;
    map["email"] = email;
    map["gender"] = gender;
    map["height"] = height;
    map["maritalStatus"] = maritalStatus;
    map["name"] = name;
    map["id"] = id;
    map["profile"] = profile;
    map["phone"] = phone;
    map["rank"] = rank;
    map["station"] = station;
    return map;
  }
}

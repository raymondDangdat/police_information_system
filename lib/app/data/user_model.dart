import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const ADDRESS = "address";
  static const PROFILE = "profile";
  static const RANK = "rank";
  static const HEIGHT = "height";
  static const GENDER = "gender";
  static const MARITAL_STATUS = "maritalStatus";
  static const STATION = "station";
  static const AGE = "age";

  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? profile;
  String? rank;
  String? height;
  String? gender;
  String? maritalStatus;
  String? station;
  int? age;

  UserModel({this.id, this.name, this.email, this.phone, this.address, this.profile,
  this.station, this.maritalStatus, this.height, this.rank, this.gender, this.age});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()![NAME];
    email = snapshot.data()![EMAIL];
    id = snapshot.data()![ID];
    phone = snapshot.data()![PHONE];
    address = snapshot.data()![ADDRESS];
    profile = snapshot.data()![PROFILE];
    rank = snapshot.data()![RANK];
    height = snapshot.data()![HEIGHT];
    gender = snapshot.data()![GENDER];
    maritalStatus = snapshot.data()![MARITAL_STATUS];
    station = snapshot.data()![STATION];
    age = snapshot.data()![AGE];

  }
}

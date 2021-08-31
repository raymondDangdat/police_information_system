import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";
  static const PHONE = "phone";
  static const ADDRESS = "address";

  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;

  UserModel({this.id, this.name, this.email, this.phone, this.address});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()![NAME];
    email = snapshot.data()![EMAIL];
    id = snapshot.data()![ID];
    phone = snapshot.data()![PHONE];
    address = snapshot.data()![ADDRESS];

  }
}

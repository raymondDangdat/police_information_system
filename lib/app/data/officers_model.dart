import 'package:cloud_firestore/cloud_firestore.dart';

class OfficerModel {
  String? id;
  String? name;
  String? rank;
  String? station;
  String? dateRecruited;
  int? age;
  String? address;
  String? height;
  String? maritalStatus;
  String? phone;
  String? gender;
  String? profile;
  String? email;
  bool? approved;


  OfficerModel({
    this.id,
    this.name,
    this.rank,
    this.profile,
    this.station,
    this.dateRecruited,
    this.age,
    this.address,
    this.height,
    this.maritalStatus,
    this.phone,
    this.email,
    this.gender,
    this.approved,

  });
  OfficerModel.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'] != null ? jsonMap['id'] : '';
    name = jsonMap['name'] != null ? jsonMap['name'] : '';
    height = jsonMap['height'] != null ? jsonMap['height'] : '';
    maritalStatus = jsonMap['maritalStatus'] != null ? jsonMap['maritalStatus'] : '';
    email = jsonMap['email'] != null ? jsonMap['email'] : '';
    rank = jsonMap['rank'] != null ? jsonMap['rank'] : '';
    station = jsonMap['station'] != null ? jsonMap['station'] : '';
    dateRecruited = jsonMap['dateRecruited'] != null ? jsonMap['dateRecruited'] : '';
    address = jsonMap['address'] != null ? jsonMap['address'] : '';
    age = jsonMap['age'] != null ? jsonMap['age'] : '';
    phone = jsonMap['phone'] != null ? jsonMap['phone'] : '';
    approved = jsonMap['approved'] != null ? jsonMap['approved'] : '';
    profile = jsonMap['profile'] != null ? jsonMap['profile'] : '';
    gender = jsonMap['gender'] != null ? jsonMap['gender'] : '';
  }

  factory OfficerModel.fromDocument(DocumentSnapshot doc) {
    return OfficerModel(
      name : doc['name'] != null ? doc['name'] : '',
      id : doc['id'] != null ? doc['id'] : '',
      height: doc['height'] != null ? doc['height'] : '',
      maritalStatus: doc['maritalStatus'] != null ? doc['maritalStatus'] : '',
      email: doc['email'] != null ? doc['email'] : '',
      address: doc['address'] != null ? doc['address'] : '',
      rank: doc['rank'] != null ? doc['rank'] : '',
        phone: doc['phone'] != null ? doc['phone'] : '',
        age: doc['age'] != null ? doc['age'] : '',
        dateRecruited: doc['dateRecruited'] != null ? doc['dateRecruited'] : '',
        station: doc['station'] != null ? doc['station'] : '',
      approved: doc['approved'] != null ? doc['approved'] : '',
        gender: doc['gender'] != null ? doc['gender'] : '',
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map["name"] = name;
    map["height"] = height;
    map["maritalStatus"] = maritalStatus;
    map["email"] = email;
    map["address"] = address;
    map["rank"] = rank;
    map["phone"] = phone;
    map["age"] = age;
    map["dateRecruited"] = dateRecruited;
    map["station"] = station;
    map["approved"] = approved;
    map["gender"] = gender;
    return map;
  }
}

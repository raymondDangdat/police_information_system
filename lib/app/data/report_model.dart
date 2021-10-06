import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  String? date;
  String? description;
  String? id;
  String? station;
  String? reportSubject;
  String? reporterName;


  ReportModel({
    this.id,
    this.date,
    this.description,
    this.reporterName,
    this.station,
    this.reportSubject,

  });
  ReportModel.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'] != null ? jsonMap['id'] : '';
    date = jsonMap['date'] != null ? jsonMap['date'] : '';
    description = jsonMap['description'] != null ? jsonMap['description'] : '';
    reporterName = jsonMap['reporterName'] != null ? jsonMap['reporterName'] : '';
    station = jsonMap['station'] != null ? jsonMap['station'] : '';
    reportSubject = jsonMap['reportSubject'] != null ? jsonMap['reportSubject'] : '';
  }

  factory ReportModel.fromDocument(DocumentSnapshot doc) {
    return ReportModel(
      date : doc['date'] != null ? doc['date'] : '',
      id : doc['id'] != null ? doc['id'] : '',
      description: doc['description'] != null ? doc['description'] : '',
      reporterName: doc['reporterName'] != null ? doc['reporterName'] : '',
      station: doc['station'] != null ? doc['station'] : '',
      reportSubject: doc['reportSubject'] != null ? doc['reportSubject'] : '',
    );
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['date'] = date;
    map["id"] = id;
    map["description"] = description;
    map["reporterName"] = reporterName;
    map["station"] = station;
    map["reportSubject"] = reportSubject;
    return map;
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "description": description,
    "reporterName": reporterName,
    "station": station,
    "reportSubject": reportSubject,
  };
}

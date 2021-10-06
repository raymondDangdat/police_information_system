import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:police_info_system/app/data/report_model.dart';
import 'package:police_info_system/app/routes/app_pages.dart';
import 'package:police_info_system/app/widgets/loading_card.dart';

class ReportsController extends GetxController {
  RxList<ReportModel> reports = RxList<ReportModel>([]);
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String collection = "pisReports";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    reports.bindStream(getAllReports());
  }

  @override
  void onClose() {}

  deleteReport(String productId) async{
    await firebaseFirestore.collection(collection).doc(productId).delete(
    );
    Get.offAllNamed(Routes.HOME);
  }

  updateReport(String officerId) async{
    LoadingCard();
    await firebaseFirestore.collection(collection).doc(officerId).update({
      "approved": true,

    });
    getAllReports();
  }


  Stream<List<ReportModel>> getAllReports() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => ReportModel.fromJSON(item.data())).toList());
}

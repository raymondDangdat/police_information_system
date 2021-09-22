import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:police_info_system/app/data/officers_model.dart';
import 'package:police_info_system/app/routes/app_pages.dart';
import 'package:police_info_system/app/widgets/loading_card.dart';

class ApproveOfficersController extends GetxController {
  RxList<OfficerModel> officers = RxList<OfficerModel>([]);
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String collection = "pisUsers";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    officers.bindStream(getAllOfficers());
  }

  @override
  void onClose() {}

  deleteProduct(String productId) async{
    await firebaseFirestore.collection(collection).doc(productId).delete(
    );
    Get.offAllNamed(Routes.HOME);
  }

  updateOfficer(String officerId) async{
    LoadingCard();
    await firebaseFirestore.collection(collection).doc(officerId).update({
      "approved": true,

    });
    getAllOfficers();
  }


  Stream<List<OfficerModel>> getAllOfficers() =>
      firebaseFirestore.collection(collection).snapshots().map((query) =>
          query.docs.map((item) => OfficerModel.fromJSON(item.data())).toList());
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenditure/models/expense.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  RxList<Expenses> expenses = <Expenses>[].obs;
  RxList<Items> items = <Items>[].obs;
  RxInt selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    expenses.bindStream(connectToExpenses());
  }

  Stream<List<Expenses>> connectToExpenses() {
    var v = FirebaseFirestore.instance
        .collection("exCollection")
        .snapshots()
        .map((query) {
      var result = query.docs.map((e) => Expenses.fromDocument(e)).toList();
      return result;
    });
    return v;
  }

  Stream<List<Items>> connectToItems(String docID) {
    var x = FirebaseFirestore.instance
        .collection("exCollection")
        .doc(docID)
        .collection("items")
        .snapshots()
        .map((query) {
      var result = query.docs.map((e) => Items.fromDocument(e)).toList();
      return result;
    });
    return x;
  }
}

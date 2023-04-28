import 'package:cloud_firestore/cloud_firestore.dart';

class Expenses {
  String? docId;
  String? title;
  double? totalAmount;

  Expenses({this.docId, this.title, this.totalAmount});

  factory Expenses.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var d = snapshot.data()!;
    return Expenses(
        docId: d["docId"], title: d["title"], totalAmount: d["totalAmount"]);
  }
}

class Items {
  String? docId;
  String? itemTitle;
  String? totalExpense;
  List? expenses;

  Items({this.docId, this.itemTitle, this.totalExpense, this.expenses});

  factory Items.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var d = snapshot.data()!;
    return Items(
        docId: d["docId"], 
        itemTitle: d["itemTitle"], 
        totalExpense: d["totalExpense"],
        expenses: d["expenses"]);
  }
}

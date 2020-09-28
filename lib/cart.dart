import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

var uuid = Uuid();

class Cartprovider {
  List<ItemModel> cartitems = [];
  additem(String title, double price) {
    firestore.collection("users").doc(firebaseUser.uid).set({
      "products": FieldValue.arrayUnion(
          [ItemModel(title: title, price: price, totalPrice: price).toMap()])
    }, SetOptions(merge: true));
  }

  removeItem(String id) {
    firestore.collection("users").doc(firebaseUser.uid).update({
      "products": FieldValue.arrayRemove([id])
    });
  }
}

class ItemModel {
  String id;
  String title;
  double price;
  double totalPrice;
  int quantity;
  ItemModel({
    this.title,
    this.price,
    quantity = 1,
    this.totalPrice,
  }) {
    id = uuid.v4();
  }

  toMap() {
    var customMap = {
      "id": id,
      "title": title,
      "price": price,
      "totalPrice": totalPrice
    };

    return customMap;
  }
}

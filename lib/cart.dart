import 'package:uuid/uuid.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final firestore = FirebaseFirestore.instance;
// final firebaseUser = FirebaseAuth.instance.currentUser;

var uuid = Uuid();

class Cartprovider {
  List<dynamic> cartitems = [];

  // init() async {
  //   var doc = await firestore.collection('users').doc(firebaseUser.uid).get();

  //   if (doc.data() != null) {
  //     cartitems = doc.data()['products'];
  //   }
  // }

  additem(String title, double price) async {
    var newItem =
        ItemModel(title: title, price: price, totalPrice: price).toMap();
    cartitems.add(newItem);
    // firestore
    //     .collection("users")
    //     .doc(firebaseUser.uid)
    //     .set({"products": cartitems}, SetOptions(merge: true));
  }

  // removeItem(String id) {
  //   firestore.collection("users").doc(firebaseUser.uid).update({
  //     "products": FieldValue.arrayRemove([id])
  //   });
  // }
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

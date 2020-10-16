import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

var uuid = Uuid();

class Cartprovider {
  List<dynamic> cartitems = [];

  init() async {
    var doc = await firestore.collection('users').doc(firebaseUser.uid).get();

    if (doc.data() != null) {
      cartitems = doc.data()['products'];
    }
  }

  additem(ItemModel item) {
    bool addNewItem = true;

    if (cartitems.length == 0) {
      cartitems.add(item.toMap());
      addNewItem = false;
    } else {
      cartitems = cartitems.map((element) {
        if (element['id'] == item.id) {
          element['quantity'] = element['quantity'] + 1;
          element['totalPrice'] += item.price;
          addNewItem = false;
        }
        return element;
      }).toList();
    }

    if (addNewItem) {
      cartitems.add(item.toMap());
    }
    firestore
        .collection("users")
        .doc(firebaseUser.uid)
        .set({"products": cartitems}, SetOptions(merge: true));
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
  String image;
  String sub;
  int quantity;
  double totalPrice;

  ItemModel({
    this.title,
    this.sub,
    this.price,
    this.image,
  }) {
    id = uuid.v4();
    quantity = 1;
    totalPrice = price;
  }

  toMap() {
    var customMap = {
      "id": id,
      "title": title,
      "price": price,
      "image": image,
      "sub": sub,
      "quantity": quantity,
      "totalPrice": totalPrice
    };

    return customMap;
  }
}

import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Cartprovider {
  List<ItemModel> cartitems = [];
  additem(ItemModel item) {
    cartitems.add(item);
  }

  removeItem(String id) {
    cartitems = cartitems.where((element) => element.id != id);
  }
}

// [i, i, j, i, j]
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
}

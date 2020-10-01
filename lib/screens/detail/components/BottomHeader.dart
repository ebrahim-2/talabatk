import 'package:flutter/material.dart';
import 'package:talabatk/cart.dart';

class BottomHeader extends StatelessWidget {
  final double price;
  final Function addItemSnackBar;
  final Function addNewItemToCart;
  final String title;
  final ItemModel item;
  final int counter;

  BottomHeader({
    @required this.price,
    this.addItemSnackBar,
    this.title,
    this.addNewItemToCart,
    this.item,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Price',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '\$$price',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        FlatButton(
          child: Text('Add To Cart',
              style: TextStyle(
                color: Colors.white,
              )),
          color: Colors.black,
          onPressed: () {
            item.quantity += counter;
            addNewItemToCart(item);
            addItemSnackBar(title);
          },
        )
      ],
    );
  }
}

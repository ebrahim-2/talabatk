import 'package:flutter/material.dart';

class BottomHeader extends StatelessWidget {
  final double price;
  final Function addItemSnackBar;
  final String title;
  BottomHeader({@required this.price, this.addItemSnackBar, this.title});

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
            addItemSnackBar(title);
          },
        )
      ],
    );
  }
}

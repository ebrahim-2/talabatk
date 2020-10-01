import 'package:flutter/material.dart';

class NameAndCount extends StatelessWidget {
  final String title;
  final Function incrementPrice;
  final Function decrementPrice;
  final double totalPrice;
  final int counter;

  NameAndCount({
    @required this.title,
    this.incrementPrice,
    this.decrementPrice,
    this.totalPrice,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mediterranean',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: incrementPrice,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "$counter",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: decrementPrice,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

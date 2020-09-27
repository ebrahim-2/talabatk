import 'package:flutter/material.dart';

class NameAndCount extends StatefulWidget {
  final String title;
  final Function incrementPrice;
  final Function decrementPrice;
  final double originalPrice;
  final double totalPrice;

  NameAndCount({
    @required this.title,
    this.incrementPrice,
    this.decrementPrice,
    this.originalPrice,
    this.totalPrice,
  });

  @override
  _NameAndCountState createState() => _NameAndCountState();
}

class _NameAndCountState extends State<NameAndCount> {
  int _count = 1;

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
              widget.title,
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
              onTap: _incr,
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
              "$_count",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: _decr,
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

  void _incr() {
    setState(() {
      _count++;
      widget.incrementPrice();
    });
  }

  void _decr() {
    setState(() {
      // ignore: unnecessary_statements
      _count > 1 ? _count-- : null;
      if (widget.originalPrice != widget.totalPrice) {
        widget.decrementPrice();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:talabatk/cart.dart';

class SmallCard extends StatefulWidget {
  final ItemModel item;
  final Function onTap;
  final Function addItemSnackBar;
  final Function addNewItemToCart;

  SmallCard({
    @required this.onTap,
    this.addItemSnackBar,
    this.addNewItemToCart,
    this.item,
  });

  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _imageAnim;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _imageAnim = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: _width / 3,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(_width),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              child: AnimatedBuilder(
                  animation: _imageAnim,
                  builder: (context, snapshot) {
                    return Transform.translate(
                      offset: Offset(0.0, 200 * (1 - _imageAnim.value)),
                      child: Image.asset(
                        widget.item.image,
                        width: _width / 2.8,
                      ),
                    );
                  }),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.item.sub,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${widget.item.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Container(
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      widget.addNewItemToCart(widget.item);
                      widget.addItemSnackBar(widget.item.title);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

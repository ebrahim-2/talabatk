import 'package:flutter/material.dart';
import 'package:talabatk/cart.dart';

class BigCard extends StatefulWidget {
  final ItemModel item;
  final Function onTap;
  final Function addItemSnackBar;
  final Function addNewItemToCart;

  BigCard({
    @required this.onTap,
    this.addItemSnackBar,
    this.addNewItemToCart,
    this.item,
  });

  @override
  _ChickenCardState createState() => _ChickenCardState();
}

class _ChickenCardState extends State<BigCard> with TickerProviderStateMixin {
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
    double _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: _height * 0.18,
        width: _width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(_width),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: (_width * 0.9) / 2.8,
              top: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
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
                    height: 8,
                  ),
                  Text(
                    '\$${widget.item.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                      onPressed: () {
                        widget.addNewItemToCart(widget.item);
                        widget.addItemSnackBar(widget.item.title);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -_width / 4.5,
              top: -50,
              bottom: -50,
              child: AnimatedBuilder(
                  animation: _imageAnim,
                  builder: (context, snapshot) {
                    return Transform.translate(
                      offset: Offset(_width * (1 - _imageAnim.value), 0),
                      child: Image.asset(
                        widget.item.image,
                        width: _width * 0.5,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

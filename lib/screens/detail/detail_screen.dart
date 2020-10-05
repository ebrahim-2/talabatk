import 'package:flutter/material.dart';
import 'package:talabatk/screens/cart/cart_screen.dart';
import 'components/BottomHeader.dart';
import 'components/CardPage.dart';
import '../../cart.dart';
import 'components/DisplayPageIndicators.dart';
import 'components/NameAndCount.dart';

class DetailScreen extends StatefulWidget {
  final Function addNewItemToCart;
  final Function removeItemFromCart;
  final ItemModel item;
  final Cartprovider cartData;

  DetailScreen({
    @required this.addNewItemToCart,
    @required this.removeItemFromCart,
    @required this.item,
    this.cartData,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
  double totalPrice;
  int counter = 1;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    totalPrice = widget.item.price;
    super.initState();
  }

  addItemSnackBar(String item) {
    print(true);
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('$item added to cart'),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Go to cart',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartScreen(data: widget.cartData);
          }));
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.more_vert),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardPage(
                pageViewNotifier: _pageViewNotifier,
                image: widget.item.image,
              ),
              DisplayPageIndicators(
                length: 3,
                pageViewNotifier: _pageViewNotifier,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: NameAndCount(
                    title: widget.item.title,
                    counter: counter,
                    totalPrice: totalPrice,
                    incrementPrice: () {
                      setState(() {
                        counter++;
                        totalPrice += widget.item.price;
                      });
                      widget.addNewItemToCart(widget.item);
                    },
                    decrementPrice: () {
                      setState(() {
                        counter--;
                        totalPrice -= widget.item.price;
                      });
                      widget.removeItemFromCart(widget.item.id);
                    }),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Text(
                      'Delivery Time',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Icon(
                      Icons.timer,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '25 Mins',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: BottomHeader(
                    price: totalPrice,
                    addItemSnackBar: addItemSnackBar,
                    addNewItemToCart: widget.addNewItemToCart,
                    item: widget.item,
                    title: widget.item.title,
                    counter: counter),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

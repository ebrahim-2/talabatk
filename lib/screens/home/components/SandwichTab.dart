import 'package:flutter/material.dart';
import 'package:talabatk/screens/detail/detail_screen.dart';
import '../../../cart.dart';
import 'SmallCard.dart';
import 'TopHeader.dart';

import 'BigCard.dart';

class SandwichTab extends StatelessWidget {
  final Function addItemSnackBar;
  final Function addNewItemToCart;
  final Function removeItemFromCart;
  final Cartprovider cartData;

  SandwichTab({
    this.addItemSnackBar,
    this.addNewItemToCart,
    this.removeItemFromCart,
    this.cartData,
  });

  final pizzaItem = ItemModel(
    title: 'Pizza',
    image: 'images/p1.png',
    price: 12,
    sub: 'All kinds of pizza',
  );

  final potatoItem = ItemModel(
      image: 'images/p3.jpg',
      price: 2.500,
      title: 'Potato Fingers',
      sub: 'Potato Fingers with salt');

  final burgerItem = ItemModel(
    title: 'Burger',
    image: 'images/h3.png',
    price: 7.00,
    sub: 'All Kind of Burger',
  );

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopHeader(),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: _height * 0.05,
                    ),
                    BigCard(
                      addItemSnackBar: addItemSnackBar,
                      addNewItemToCart: addNewItemToCart,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              cartData: cartData,
                              addNewItemToCart: addNewItemToCart,
                              removeItemFromCart: removeItemFromCart,
                              item: pizzaItem,
                            ),
                          ),
                        );
                      },
                      item: pizzaItem,
                    ),
                    SizedBox(
                      height: _height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmallCard(
                          addNewItemToCart: addNewItemToCart,
                          addItemSnackBar: addItemSnackBar,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  cartData: cartData,
                                  addNewItemToCart: addNewItemToCart,
                                  removeItemFromCart: removeItemFromCart,
                                  item: potatoItem,
                                ),
                              ),
                            );
                          },
                          item: potatoItem,
                        ),
                        SmallCard(
                          addItemSnackBar: addItemSnackBar,
                          addNewItemToCart: addNewItemToCart,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  cartData: cartData,
                                  addNewItemToCart: addNewItemToCart,
                                  removeItemFromCart: removeItemFromCart,
                                  item: burgerItem,
                                ),
                              ),
                            );
                          },
                          item: burgerItem,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

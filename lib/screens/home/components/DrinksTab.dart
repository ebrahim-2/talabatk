import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talabatk/cart.dart';
import 'package:talabatk/screens/detail/detail_screen.dart';
import 'SmallCard.dart';
import 'TopHeader.dart';

import 'BigCard.dart';

class DrinksTab extends StatelessWidget {
  final Function addItemSnackBar;
  final Function addNewItemToCart;
  final Function removeItemFromCart;
  final Cartprovider cartData;

  DrinksTab({
    this.addItemSnackBar,
    this.addNewItemToCart,
    this.removeItemFromCart,
    this.cartData,
  });

  final cokeItem = ItemModel(
    title: 'CokeCola',
    image: 'images/co3.png',
    price: 30,
    sub: 'CokeCola classic',
  );

  final orangeItem = ItemModel(
    title: 'Orange juice',
    image: 'images/co2.jpg',
    price: 24,
    sub: 'Juice with ice',
  );

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: new SafeArea(
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
                      height: _height * 0.10,
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
                              removeItemFromCart: removeItemFromCart,
                              addNewItemToCart: addNewItemToCart,
                              item: cokeItem,
                            ),
                          ),
                        );
                      },
                      item: cokeItem,
                    ),
                    SizedBox(
                      height: _height * 0.10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmallCard(
                          addItemSnackBar: addItemSnackBar,
                          addNewItemToCart: addNewItemToCart,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  cartData: cartData,
                                  removeItemFromCart: removeItemFromCart,
                                  addNewItemToCart: addNewItemToCart,
                                  item: orangeItem,
                                ),
                              ),
                            );
                          },
                          item: orangeItem,
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
                                  removeItemFromCart: removeItemFromCart,
                                  addNewItemToCart: addNewItemToCart,
                                  item: orangeItem,
                                ),
                              ),
                            );
                          },
                          item: orangeItem,
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

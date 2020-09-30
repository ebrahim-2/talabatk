import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talabatk/cart.dart';
import 'package:talabatk/screens/detail/detail_screen.dart';
import 'SmallCard.dart';
import 'TopHeader.dart';

import 'BigCard.dart';

class DrinksTab extends StatelessWidget {
  const DrinksTab(
      {this.addItemSnackBar,
      this.context,
      this.addNewItemToCart,
      this.removeItemFromCart,
      this.data});

  final Function addItemSnackBar;
  final Function addNewItemToCart;
  final Function removeItemFromCart;
  final Cartprovider data;
  final BuildContext context;
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
                              data: data,
                              removeItemFromCart: removeItemFromCart,
                              addNewItemToCart: addNewItemToCart,
                              image: 'images/h1.jpg',
                              price: 30.00,
                              title: 'Chicken Salad',
                            ),
                          ),
                        );
                      },
                      title: 'Chicken Salad',
                      image: 'images/co3.png',
                      price: 30,
                      sub: 'Chicken with Avocado',
                    ),
                    SizedBox(
                      height: _height * 0.06,
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
                                  data: data,
                                  removeItemFromCart: removeItemFromCart,
                                  addNewItemToCart: addNewItemToCart,
                                  image: 'images/mixed.png',
                                  price: 24.00,
                                  title: 'Mixed Salad',
                                ),
                              ),
                            );
                          },
                          title: 'Mixed Salad',
                          image: 'images/co2.jpg',
                          price: 24,
                          sub: 'Mix Vegetables',
                        ),
                        SmallCard(
                          addItemSnackBar: addItemSnackBar,
                          addNewItemToCart: addNewItemToCart,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  data: data,
                                  removeItemFromCart: removeItemFromCart,
                                  addNewItemToCart: addNewItemToCart,
                                  image: 'images/mixed.png',
                                  price: 24.00,
                                  title: 'Quinoa Salad',
                                ),
                              ),
                            );
                          },
                          title: 'Quinoa Salad',
                          image: 'images/co2.jpg',
                          price: 24.00,
                          sub: 'Spicy with garlic',
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

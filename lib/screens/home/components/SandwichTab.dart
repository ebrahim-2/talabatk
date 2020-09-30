import 'package:flutter/material.dart';
import 'package:talabatk/screens/detail/detail_screen.dart';
import '../../../cart.dart';
import 'SmallCard.dart';
import 'TopHeader.dart';

import 'BigCard.dart';

class SandwichTab extends StatelessWidget {
  const SandwichTab(
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
                              data: data,
                              addNewItemToCart: addNewItemToCart,
                              removeItemFromCart: removeItemFromCart,
                              image: 'images/p1.png',
                              price: 12.000,
                              title: 'Pizza',
                            ),
                          ),
                        );
                      },
                      title: 'Pizza',
                      image: 'images/p1.png',
                      price: 12,
                      sub: 'All kinds of pizza',
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
                                  data: data,
                                  addNewItemToCart: addNewItemToCart,
                                  removeItemFromCart: removeItemFromCart,
                                  image: 'images/p3.jpg',
                                  price: 2.500,
                                  title: 'potato Fingers',
                                ),
                              ),
                            );
                          },
                          title: 'potato Fingers ',
                          image: 'images/p3.jpg',
                          price: 2.5,
                          sub: '',
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
                                  addNewItemToCart: addNewItemToCart,
                                  removeItemFromCart: removeItemFromCart,
                                  image: 'images/h3.png',
                                  price: 7.000,
                                  title: 'Burger',
                                ),
                              ),
                            );
                          },
                          title: 'Burger',
                          image: 'images/h3.png',
                          price: 7.00,
                          sub: 'All Kind of Burger',
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

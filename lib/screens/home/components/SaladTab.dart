import 'package:flutter/material.dart';
import 'package:talabatk/cart.dart';
import 'package:talabatk/screens/detail/detail_screen.dart';
import 'package:talabatk/screens/home/components/BigCard.dart';
import 'package:talabatk/screens/home/components/SmallCard.dart';
import 'package:talabatk/screens/home/components/TopHeader.dart';

class SaladTab extends StatelessWidget {
  SaladTab({
    Key key,
    @required double height,
    this.addItemSnackBar,
    this.addNewItemToCart,
    this.cartData,
    this.removeItemFromCart,
  })  : _height = height,
        super(key: key);

  final double _height;
  final Function addItemSnackBar;
  final Function addNewItemToCart;
  final Function removeItemFromCart;
  final Cartprovider cartData;

  final chickenSalad = ItemModel(
    title: 'Chicken Salad',
    image: 'images/chicken.png',
    price: 5,
    sub: 'Chicken with Avocado',
  );

  final mixedSalad = ItemModel(
      title: 'Mixed Salad',
      image: 'images/mixed.png',
      price: 5,
      sub: 'Mix Vegetables');

  final quinoaSalad = ItemModel(
    title: 'Quinoa Salad',
    image: 'images/mixed.png',
    price: 4.5,
    sub: 'Spicy with garlic',
  );

  @override
  Widget build(BuildContext context) {
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
                      height: _height * 0.09,
                    ),
                    BigCard(
                        addItemSnackBar: addItemSnackBar,
                        addNewItemToCart: addNewItemToCart,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                removeItemFromCart: removeItemFromCart,
                                addNewItemToCart: addNewItemToCart,
                                item: chickenSalad,
                                cartData: cartData,
                              ),
                            ),
                          );
                        },
                        item: chickenSalad),
                    SizedBox(
                      height: _height * 0.08,
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
                                    removeItemFromCart: removeItemFromCart,
                                    addNewItemToCart: addNewItemToCart,
                                    cartData: cartData,
                                    item: mixedSalad,
                                  ),
                                ),
                              );
                            },
                            item: mixedSalad),
                        SmallCard(
                          addItemSnackBar: addItemSnackBar,
                          addNewItemToCart: addNewItemToCart,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  removeItemFromCart: removeItemFromCart,
                                  addNewItemToCart: addNewItemToCart,
                                  cartData: cartData,
                                  item: quinoaSalad,
                                ),
                              ),
                            );
                          },
                          item: quinoaSalad,
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

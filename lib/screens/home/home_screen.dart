// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talabatk/cart.dart';
import 'package:talabatk/screens/cart/cart_screen.dart';
import 'package:talabatk/screens/home/components/DrinksTab.dart';
import 'package:talabatk/screens/home/components/SaladTab.dart';
import 'package:talabatk/screens/home/components/SandwichTab.dart';
import 'package:talabatk/screens/shared/components/Menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var cartProvider = Cartprovider();

  @override
  void initState() {
    super.initState();
    // cartProvider.init();
  }
  // final _auth =FirebaseAuth.instance;

  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // void getCurrentUser () {
  //   try {
  //     final user =   _auth.currentUser;
  //     if (user!=null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }}
  //   catch(e){
  //     print(e);
  //   }
  // }
  addItemSnackBar(String item) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('$item added to cart'),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Go to cart',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartPage(data: cartProvider);
          }));
        },
      ),
    ));
  }

  addNewItemToCart(ItemModel item) {
    cartProvider.additem(item);
  }

  removeItemFromCart(String id) {
    // cartProvider.removeItem(id);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            child: Image.asset(
              'images/menu.png',
              width: 24,
            ),
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CartPage(data: cartProvider);
                      },
                    ));
                  },
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.black,
                ))
          ],
          iconTheme: IconThemeData(color: Colors.black),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                  child: Text(
                'Salad',
              )),
              Tab(
                  child: Text(
                'Meals',
              )),
              Tab(
                  child: Text(
                'Drinks',
              )),
            ],
          )),
      body: TabBarView(
        children: [
          SaladTab(
            height: _height,
            addItemSnackBar: addItemSnackBar,
            addNewItemToCart: addNewItemToCart,
            cartData: cartProvider,
            removeItemFromCart: removeItemFromCart,
          ),
          SandwichTab(
            addItemSnackBar: addItemSnackBar,
            addNewItemToCart: addNewItemToCart,
            cartData: cartProvider,
            removeItemFromCart: removeItemFromCart,
          ),
          DrinksTab(
            addItemSnackBar: addItemSnackBar,
            addNewItemToCart: addNewItemToCart,
            cartData: cartProvider,
            removeItemFromCart: removeItemFromCart,
          ),
        ],
      ),
    );
  }
}

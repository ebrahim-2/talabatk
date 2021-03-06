// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talabatk/screens/orders_screen.dart';
import 'package:talabatk/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseUser = FirebaseAuth.instance;

class Menu extends StatelessWidget {
  // final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'food',
                  child: Container(
                    child: Image.asset('images/food.gif'),
                    height: 80.0,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Talabatk',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('My Orders'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              firebaseUser.signOut();
              Navigator.pushNamed(context, '/welcome');
            },
          ),
        ],
      ),
    );
  }
}

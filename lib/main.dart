import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talabatk/screens/cart/cart_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/register/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //     textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black87))),
      title: "talabatk",
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => DefaultTabController(
              length: 3,
              child: HomeScreen(),
            ),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}

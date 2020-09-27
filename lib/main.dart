// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talabatk/screens/cart/cart_screen.dart';
import 'package:talabatk/screens/home/components/DrinksTab.dart';
import 'package:talabatk/screens/home/components/SandwichTab.dart';
import 'package:talabatk/screens/home/home_screen.dart';
import 'package:talabatk/screens/login/login_screen.dart';
import 'package:talabatk/screens/register/register_screen.dart';
import 'package:talabatk/screens/welcome/welcome_screen.dart';

// import 'screens/login/login_screen.dart';
// import 'screens/welcome/welcome_screen.dart';
// import 'screens/register/register_screen.dart';

// import 'Drinks.dart';
// import 'LoginScreen.dart';
// import 'Sandwich.dart';

// import 'Log1.dart';
// import 'cartpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
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

      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/home',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => DefaultTabController(
              length: 3,
              child: HomeScreen(),
            ),
        // '/sandwich': (context) => Sandwich(),
        // '/drinks': (context) => Drinks(),
        // '/cartpage': (context) => CartPage(),
      },
    );
  }
}

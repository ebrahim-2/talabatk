import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'Log1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:talabatk/screens/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Header(),
                SizedBox(
                  height: 24.0,
                ),
                EmailField(
                  handleChange: (value) {
                    email = value;
                  },
                ),
                PasswordField(
                  handleChange: (value) {
                    password = value;
                  },
                ),
                SubmitButton(
                  handleSubmit: _handleSubmit,
                  text: 'Login',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() async {
    try {
      setState(() {
        showSpinner = true;
      });
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushNamed(context, '/home');
      }
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
    }
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Hero(
          tag: 'food',
          child: Container(
            child: Image.asset('images/food.gif'),
            height: 124.0,
          ),
        ),
        Text(
          'Welcome To Talbatk',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

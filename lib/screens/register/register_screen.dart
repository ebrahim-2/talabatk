import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

part './components/Header.dart';
part 'components/SubmitButton.dart';
part './components/PasswordField.dart';
part 'components/EmailField.dart';
part 'components/NumberField.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  bool showSpinner = false;
  String email;
  String number;
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
                NumberField(
                  handleChange: (value) {
                    number = value;
                  },
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
                  text: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (newUser != null) {
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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = '';
  String phoneNumber = '';

  _getUserInfo() async {
    var doc = await firestore.collection('users').doc(firebaseUser.uid).get();
    phoneNumber = doc.data()['phoneNumber'];
    email = firebaseUser.email;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        width: size.width,
        child: Column(
          children: [
            Icon(
              Icons.circle,
              size: 150,
              color: Colors.grey[400],
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: _getUserInfo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      Text(
                        phoneNumber,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        email,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'Log1.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

// // ignore: must_be_immutable
// class LoginScreen extends StatefulWidget {
//   String id = "LoginScreen";
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool showSpinner = false;
//   final _auth = FirebaseAuth.instance;
//   String email;
//   String password;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 24.0,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Hero(
//                     tag: 'food',
//                     child: Container(
//                       child: Image.asset('images/food.gif'),
//                       height: 124.0,
//                     ),
//                   ),
//                   Text(
//                     'Welcome To Tlbatk',
//                     style: TextStyle(
//                       fontFamily: 'PermanentMarker',
//                       fontSize: 26.0,
//                       color: Colors.black87,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 24.0,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 cursorColor: Colors.purple,
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//                 textInputAction: TextInputAction.next,
//                 onChanged: (value) {
//                   email = value;
//                 },
//                 decoration: InputDecoration(
//                   icon: Icon(
//                     Icons.email,
//                     color: Colors.black,
//                   ),
//                   hintText: 'Enter Your Email',
//                   hintStyle: TextStyle(
//                     color: Colors.black12,
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.purple, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: Colors.deepPurple, width: 3.0),
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 24.0,
//               ),
//               TextField(
//                 cursorColor: Colors.pinkAccent,
//                 obscureText: true,
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//                 onChanged: (value) {
//                   password = value;
//                 },
//                 decoration: InputDecoration(
//                   icon: Icon(
//                     Icons.vpn_key,
//                     color: Colors.black,
//                   ),
//                   hintText: 'Enter Your password',
//                   hintStyle: TextStyle(
//                     color: Colors.black12,
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: Colors.yellowAccent, width: 3.0),
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.yellow, width: 2.0),
//                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 24.0,
//               ),
//               FlatButton(
//                 onPressed: () async {
//                   try {
//                     setState(() {
//                       showSpinner = true;
//                     });
//                     final user = await _auth.signInWithEmailAndPassword(
//                         email: email, password: password);
//                     if (user != null) {
//                       Navigator.pushNamed(context, Log1().id);
//                     }
//                     setState(() {
//                       showSpinner = false;
//                     });
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 child: Text(
//                   'Log In ',
//                   style: TextStyle(
//                     fontFamily: 'Pacifico',
//                     fontSize: 25.0,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

part of '../register_screen.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key key,
    @required this.handleChange,
  }) : super(key: key);

  final Function handleChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: TextField(
        cursorColor: Colors.pinkAccent,
        obscureText: true,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        onChanged: handleChange,
        decoration: InputDecoration(
          icon: Icon(
            Icons.vpn_key,
            color: Colors.black,
          ),
          hintText: 'Enter Your password',
          hintStyle: TextStyle(
            color: Colors.black12,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellowAccent, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}

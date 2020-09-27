part of '../register_screen.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key key,
    @required this.handleChange,
  }) : super(key: key);

  final Function handleChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.purple,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        textInputAction: TextInputAction.next,
        onChanged: handleChange,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Colors.black,
          ),
          hintText: 'Enter Your Email',
          hintStyle: TextStyle(
            color: Colors.black12,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}

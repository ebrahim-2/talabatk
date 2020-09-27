part of '../register_screen.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    Key key,
    @required this.handleChange,
  }) : super(key: key);

  final Function handleChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: TextField(
        keyboardType: TextInputType.phone,
        cursorColor: Colors.purple,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        textInputAction: TextInputAction.next,
        onChanged: handleChange,
        decoration: InputDecoration(
          icon: Icon(
            Icons.phone,
            color: Colors.black,
          ),
          hintText: 'Enter Your Phone Number',
          hintStyle: TextStyle(
            color: Colors.black12,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}

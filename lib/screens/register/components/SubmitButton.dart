part of '../register_screen.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
    @required this.handleSubmit,
    @required this.text,
  }) : super(key: key);

  final Function handleSubmit;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: handleSubmit,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 25.0,
          color: Colors.black87,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

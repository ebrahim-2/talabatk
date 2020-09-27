part of '../welcome_screen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      child: Material(
        elevation: 5.0,
        color: Colors.pink,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            'Sign Up ',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black87,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

part of '../welcome_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
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
        color: Colors.yellowAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            'Log In ',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

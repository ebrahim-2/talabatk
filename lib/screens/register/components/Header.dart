part of '../register_screen.dart';

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
            fontSize: 26.0,
            color: Colors.black87,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

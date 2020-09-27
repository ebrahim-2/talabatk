part of '../welcome_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: ColorizeAnimatedTextKit(
        text: [
          "Talabatk",
          "Quick Meal",
          "Restaurant",
        ],
        textStyle: TextStyle(fontSize: 60.0, fontFamily: 'Pacifico'),
        colors: [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],

        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.center,
        // or Alignment.topLeft
      ),
    );
  }
}

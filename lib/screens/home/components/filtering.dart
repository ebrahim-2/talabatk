import 'package:flutter/material.dart';

class Filtering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    var route = ModalRoute.of(context);
    var currentRoute = route.settings.name;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: _width / 4,
          height: 40,
          decoration: BoxDecoration(
            color: currentRoute == '/home' ? Colors.black : Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: FlatButton(
            onPressed: () {},
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Center(
                child: Text(
                  'Salad',
                  style: TextStyle(
                    color:
                        currentRoute == '/home' ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: _width / 4,
          height: 40,
          decoration: BoxDecoration(
            color:
                currentRoute == '/sandwich' ? Colors.black : Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sandwich');
            },
            child: Center(
              child: Text(
                'Meals',
                style: TextStyle(
                  color:
                      currentRoute == '/sandwich' ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: _width / 4,
          height: 40,
          decoration: BoxDecoration(
            color: currentRoute == '/drinks' ? Colors.black : Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/drinks');
            },
            child: Center(
              child: Text(
                'drinks',
                style: TextStyle(
                  color:
                      currentRoute == '/drinks' ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        Icon(Icons.filter_list),
      ],
    );
  }
}

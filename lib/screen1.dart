import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  Screen1(this.temp, this.description, this.city);

  final int temp;
  final String description;
  final String city;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Weather")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$city', style: Theme.of(context).textTheme.headline3),
            Text(' $temp°', style: Theme.of(context).textTheme.headline2),
            Text('$description', style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
    );
  }
}

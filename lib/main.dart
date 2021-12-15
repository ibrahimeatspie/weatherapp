import 'package:flutter/material.dart';

import 'screen1.dart';
import 'screen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Screen2(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intermediate_flutter_itbox/screen/home_screens.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomeScreen()
    );
  }
}

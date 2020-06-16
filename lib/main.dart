import 'package:coronatiem/screens/coronaHome.dart';
import 'package:coronatiem/utils/styles.dart' as style;
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: style.Colors.mainColor),
      title: 'Corona Tiem',
      home: CoronaHome(),
    );
  }
}
  
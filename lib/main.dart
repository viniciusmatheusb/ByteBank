import 'package:bytebank/telas/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebank());
}

class Bytebank extends StatelessWidget {
  const Bytebank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green[900],
            appBarTheme: AppBarTheme(color: Colors.green[900])),
        home: const Dashboard());
  }
}

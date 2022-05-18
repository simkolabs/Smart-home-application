import 'package:flutter/material.dart';
import 'package:home_security/user/UserHome.dart';
import 'package:home_security/user/individual_item.dart';
import 'package:home_security/user/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserHome()
    );
  }
}

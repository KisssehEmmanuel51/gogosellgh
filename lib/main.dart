import 'package:flutter/material.dart';
import 'package:gosellgh/shopapp/shoppages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gossellgh',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home:ShopHome(),
    );
  }
}

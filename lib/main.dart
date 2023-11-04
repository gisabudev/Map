import 'package:flutter/material.dart';

import 'PAges/hme_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp(homeScreen:HomeScreen() ,));
}

class MyApp extends StatefulWidget {
  final Widget?homeScreen;
  const MyApp({super.key, this.homeScreen});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget.homeScreen,
    );
  }
}

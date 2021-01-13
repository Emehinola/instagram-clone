import 'package:flutter/material.dart';
import 'package:instagram/screens/home_navigator.dart';

Future<void> main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
        primarySwatch: null,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeNav(),
    );
  }
}

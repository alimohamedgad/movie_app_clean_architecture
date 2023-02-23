import 'package:flutter/material.dart';
import 'Tv/Preseintion/Screens/tv_screen.dart';
import 'core/serviceLocator/locator.dart';


void main() {
  ServiceLocator().initTv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: const TvScreen(),
    );
  }
}

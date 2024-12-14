import 'package:ecommercedzaky/electronic.dart';
import 'package:ecommercedzaky/gridmanclothes.dart';
import 'package:ecommercedzaky/gridmanshoes.dart';
import 'package:ecommercedzaky/gridwomenclothe.dart';
import 'package:ecommercedzaky/onboardingpage.dart';
// import 'package:ecommercedzaky/gridwomenclothe.dart';
// import 'package:ecommercedzaky/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
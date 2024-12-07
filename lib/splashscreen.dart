import 'dart:async';

// import 'package:ecommercedzaky/allproduct.dart';
import 'package:ecommercedzaky/electronic.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
      const Duration(seconds:3),
      (() => Navigator.of(context).pushReplacement
      (MaterialPageRoute(builder:(BuildContext context)=> const GridElectronic())
    )
    )
    );
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('./images/cart.png'),
      ),

    );

  }
}
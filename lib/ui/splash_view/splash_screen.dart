import 'dart:async';
import 'package:flutter/material.dart';
import '../../res/constants.dart';
import '../common_widget/soft_button.dart';
import '../homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CircularSoftButton(
            radius: 60,
            icon: Center(
              child: Image.asset('assets/icons/splash.png', height: 50, width: 50,scale: 1,),
            )
        ),
      ),
    );
  }
}
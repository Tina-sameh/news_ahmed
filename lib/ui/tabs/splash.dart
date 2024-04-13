
import 'package:flutter/material.dart';
import 'package:news_ahmed/ui/collections/appAssets.dart';

import 'home.dart';
class Splash extends StatefulWidget {
  static String routeName="Spalsh";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: [
            Image.asset(AppAssets.splash),
          ],
        )
    );
  }
}


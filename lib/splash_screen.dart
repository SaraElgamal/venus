import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'core/components/components.dart';
import 'features/HomePage/home_page.dart';
import 'features/onBoarding/onBoarding.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
  {


  @override
  void initState() {


    Future.delayed(const Duration(seconds: 4),(){
      navigateTo(context,   OnBoardingScreen());
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Center(
            child:  Lottie.asset('assets/animation/Animation - 1705013443817.json'
            ,
              width: 220.w,
            ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//@dart=2.10


import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:queare/app/controllers/onboarding_controller.dart';
import 'package:queare/app/screens/onboarding_screen.dart';
import 'app/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(DevicePreview(
      builder: (context) =>  QueAreRoot(), enabled: false));
}

class QueAreRoot extends StatelessWidget {
  
  Map<int, Widget> op = {1: HomeScreen(), 2: HomeScreen()};
  OnBoardingController onBoardingController = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return GetMaterialApp( 
      title: 'QueAre!',
      home: CustomSplash(
      imagePath: 'assets/images/logo.png', 
      backGroundColor: Colors.black,
      // backGroundColor: Color(0xfffc6042),
      animationEffect: 'fade-in',
      logoSize: 100,
      home: onBoardingController.isShowed ? OnBoardingScreen():   HomeScreen(),
      duration: 3000,
      type: CustomSplashType.StaticDuration,
      outputAndHome: op,
    ),
    );
  }
}

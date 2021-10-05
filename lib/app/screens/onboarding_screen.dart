import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:queare/app/controllers/onboarding_controller.dart';
import 'package:queare/app/screens/home_screen.dart';
import '../constants/constants.dart' as Constants;
import 'package:get/get.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  void _onIntroEnd(context) {
   onBoardingController.changeShowed(true);
   print(onBoardingController.isShowed);
   Get.off(const HomeScreen());
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/slider/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = PersianFonts.Vazir.copyWith(fontSize: 19.0, color: Colors.white); 

    var pageDecoration =  PageDecoration(
      titleTextStyle:  PersianFonts.Shabnam.copyWith(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white), 
      bodyTextStyle: bodyStyle,
      descriptionPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.black,
      
      pages: [
        PageViewModel(
          title: Constants.StringConstants.slider1Title,
          body: Constants.StringConstants.slider1Body,
          image: _buildImage('1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: Constants.StringConstants.slider2Title, 
          body: Constants.StringConstants.slider2Body,
          image: _buildImage('2.png'), // mahahl aks
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: Constants.StringConstants.slider3Title, 
          body: Constants.StringConstants.slider3Body,
          image: _buildImage('3.png'), // mahahl aks
          decoration: pageDecoration,
        )
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      rtl: true,
      skip: const Text(
        'Skip',
      ), 
      next: const Icon(
        Icons.arrow_forward,
      ), // icon flash defalut => abi
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      
    );
  }
}


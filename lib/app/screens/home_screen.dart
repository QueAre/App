import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:queare/app/screens/scanner_screen.dart';
import 'package:queare/app/screens/wallet_screen.dart';
import '../constants/constants.dart' as Constants show ColorConstants;
import '../controllers/index_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List pages = [  WalletScreen(), ScannerScreen(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          setState(() {
                    selectedIndex = index;
                  });
        },
        selectedIndex: selectedIndex,
        rippleColor: Colors.black,
        hoverColor: Constants.ColorConstants.blueLight,
        gap: 4,
        activeColor: Colors.white,
        iconSize: 40,
        backgroundColor: Colors.black,
        //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: Colors.black,
        color: Colors.white,
        tabs: const [
          GButton(
          gap: 5,
            icon: Icons.credit_card,
            text: 'Wallet',
          ),
          GButton(
          gap: 5,
            icon: Icons.qr_code_scanner,
            text: 'QueAre!',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}

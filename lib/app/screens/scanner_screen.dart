//@dart=2.10
import 'package:flutter/material.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:queare/app/screens/home_screen.dart';
import 'package:queare/app/screens/payment_screen.dart';
import '../constants/constants.dart' as Constants;
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'dart:io';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  TextStyle style = PersianFonts.Vazir.copyWith(color: Colors.white);

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildQrView(context)
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 280.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flfutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.black,
          borderRadius: 10,
          borderLength: 50,
          borderWidth: 30,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      Uri uri = Uri.parse(result.code);
    if(uri.host == "queare.ir") {
    	 Get.to(PaymentScreen());
    }else{
      Get.offAll(const HomeScreen());
      
    	Get.defaultDialog(
        backgroundColor: Colors.red, 
        title: Constants.StringConstants.scannerErrorDialogTitle, 
        titleStyle: style,
        content: Text(Constants.StringConstants.scannerErrorDialogContent, style: style,),
      );
    }
    });
    
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      Get.snackbar("خطا!", "دسترسی داده نشد!", backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);

    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
    




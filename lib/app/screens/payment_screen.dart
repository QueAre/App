import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'package:queare/app/screens/home_screen.dart';
import '../constants/constants.dart' as Constants;



class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextStyle style = PersianFonts.Vazir.copyWith(color: Colors.white);
  String dropdownValue = 'Bitcoin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 30,),
          Image.asset("assets/images/payment.png"),
          SizedBox(height: 50),
          content(Constants.StringConstants.paymentShopTitle, Constants.StringConstants.paymentShopName),
          SizedBox(height: 20,),
          content(Constants.StringConstants.paymentDateTitle, Constants.StringConstants.paymentDate),
          SizedBox(height: 50,),
          DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Bitcoin(BTC)', 'Ethereum(ETH)', 'Tron(TRX)',"Ripple(XRP)" ,'Thther(USDT)']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: 
              Text(value),
            
        
        );
      }).toList(),
    ),
          SizedBox(
                    width: Get.width - 40,
                    child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(90, 43),
                        primary: Constants.ColorConstants.darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5),

                        ),
                      ),
                      onPressed: () {
                        Get.defaultDialog(
                          title: Constants.StringConstants.paymentSuccesDialogTitle,
                          content: Text(Constants.StringConstants.paymentSuccesDialogContent, style: style),
                          titleStyle: style, 
                          backgroundColor: Colors.green[400],
                          textConfirm: Constants.StringConstants.paymentSuccesDialogButtonContent,
                          onConfirm: () {
                            Get.offAll(const HomeScreen());
                          },
                          confirmTextColor: Colors.white,
                          buttonColor: Colors.green, 
                      
                        );
                      },
                      child: const Text(
                        Constants.StringConstants.paymentBuyButtonContent,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}










Widget content(String content, String title,){
  TextStyle style = PersianFonts.Vazir.copyWith(color: Colors.white);
  return Row(children: [
    Text(title, style: style,),
    Divider(indent: 230),
    Text(content, style: style),
  ],);
}
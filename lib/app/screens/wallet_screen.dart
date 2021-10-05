import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import '../constants/constants.dart' as Constants;

//fluttertoast: ^8.0.8
List _colorsPlate = <Color>[
  /* SCSS HEX */
  const Color(0xff131314),
  const Color(0xffbfc0bf),
  const Color(0xff625d5e),
  const Color(0xff759a8a),
  const Color(0xff232c2b),
  const Color(0xff323030),
  const Color(0xff5b4ca3),
  const Color(0xff365a4a),
  const Color(0xff30276a),
  const Color(0xffffffff)
];
const kBoldText = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const kHeavy = TextStyle(color: Colors.white, fontWeight: FontWeight.w700);
const klight = TextStyle(color: Colors.white, fontWeight: FontWeight.w400);

class Trades {
  final String name;
  final String shortname;
  RxInt userValue;
  final String path;
  Trades({this.name, this.path, this.shortname, this.userValue});
  
}

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key key}) : super(key: key);
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  // PreferredSizeWidget bottom = PreferredSize(
  //     child: Container(child: Center(child: Text('Wallet'))),
  //     preferredSize: Size.fromHeight(40));

  get _colorPlate => _colorsPlate;
  get _coins => _coins;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(body: _body(context), backgroundColor: Colors.black);
  }

  var cryptos = "assets/images/cryptos/png";

  _body(context) {
    List<Trades> _coins = [
      Trades(
          name: 'Bitcoin',
          shortname: 'BTC',
          userValue: 5.obs,
          path: "${cryptos}/Bitcoin.png"),
      Trades(
          name: 'Ethereum',
          shortname: 'ETH',
          userValue: 10.obs,
          path: "${cryptos}/Ethereum.png"),
      Trades(
          name: 'Tron',
          shortname: 'TRX',
          userValue: 300.obs,
          path: "${cryptos}/Tron.png"),
      Trades(
          name: 'Ripple',
          shortname: 'XRP',
          userValue: 150.obs,
          path: "${cryptos}/Ripple.png"),
      Trades(
          name: 'Tether',
          shortname: 'USDT',
          userValue: 100.obs,
          path: "${cryptos}/USDT.png"),
    ];

    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;

    return Container(
        width: width,
        color: Colors.black,
        height: height,
        child: 
          ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: _colorsPlate[4],
                  shadowColor: Colors.transparent,
                  borderOnForeground: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                        ListTile(
                          onTap: () {},
                          // isThreeLine: true,
                          trailing:
                              Text('${_coins[index].userValue}', style: kHeavy),
                          title: Text('${_coins[index].name}', style: kBoldText),
                          subtitle:
                              Text('${_coins[index].shortname}', style: klight),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("${_coins[index].path}"),
                          ),
                        ),
                      Row(
                        children: [
                          Container(),
                          Container(),
                          _addButton(index, _coins)
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: _coins.length),
        );
  }

  _addButton(index, List<Trades> _coins) {
    return IconButton(
        onPressed: () {
          var userValue = _coins[index].userValue;
          setState(() {
            _showSnack(_coins, index, userValue.value);
            // tvaluerade s.SetTrade(index);
          });
        },
        
        icon: const Icon(Icons.add_circle_outline, size: 28, color: Constants.ColorConstants.darkBlue));
  }

  _showSnack(List<Trades> _coin, int index, int value) =>
      Get.snackbar("عملیات با موفقیت انجام شد","موجودی شما افزایش یافت", backgroundColor: Constants.ColorConstants.darkBlue, snackPosition: SnackPosition.BOTTOM);
}

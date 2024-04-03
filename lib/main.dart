import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'deeppoor.com',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _snackBarVisible = false;

  void _handleTap(bool show) {
    setState(() {
      _snackBarVisible = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.only(top: 38.0, left: 18.0, right: 18.0, bottom: 28.0),
              foregroundDecoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 245, 219, 229), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 254, 252, 253),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 135,
                    height: 135,
                    child: kIsWeb
                        ? SvgPicture.asset(
                            "assets/icons/gril.svg",
                            semanticsLabel: 'Gril',
                            width: 135,
                            height: 135,
                          )
                        : Lottie.asset('assets/lottie/girl.json'),
                  ),
                  const SizedBox(
                    height: 16.0,
                    width: 0.0,
                  ),
                  SizedBox(
                    height: 18,
                    width: 135,
                    child: kIsWeb ? Container() : Lottie.asset("assets/lottie/bee.json"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: .0, left: 18.0, right: 18.0),
                    child: Tooltip(
                      message: "穷奇",
                      decoration: const BoxDecoration(color: Colors.transparent),
                      verticalOffset: 14,
                      textStyle: const TextStyle(color: Color.fromARGB(255, 255, 185, 205), fontFamily: 'ZHFont'),
                      child: Theme(
                        data: ThemeData(fontFamily: 'LogoFont'),
                        child: const Text(
                          'deeppoor',
                          style: TextStyle(color: Color.fromARGB(255, 255, 185, 205), fontFamily: 'LogoFont', fontSize: 24.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: _snackBarVisible ? 52.0 : 0.0,
            left: 10,
            right: 10,
            child: InkWell(
              child: Wrap(alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                Tooltip(
                  message: "如果你为富裕而烦恼，为什么不捐赠给我呢？下面是我的卡号",
                  child: footText("If you are troubled by being too rich, why not donate to me? My bank card: "),
                ),
                SvgPicture.asset(
                  "assets/icons/unionpay.svg",
                  // colorFilter: const ColorFilter.mode(Color.fromARGB(255, 255, 185, 205), BlendMode.srcIn),
                  semanticsLabel: 'UnionPay',
                  width: 12,
                  height: 12,
                ),
                footText(" 6214"),
                footText(" 8358"),
                footText(" 9272"),
                footText(" 5795"),
              ]),
              onTap: () {
                copyBankCardNumber(context, _handleTap);
              },
              onDoubleTap: () {
                copyBankCardNumber(context, _handleTap);
              },
              onSecondaryTap: () {
                copyBankCardNumber(context, _handleTap);
              },
              onLongPress: () {
                copyBankCardNumber(context, _handleTap);
              },
            ),
          )
        ],
      ),
    );
  }
}

Text footText(String text) {
  return Text(text, style: const TextStyle(color: Color.fromARGB(255, 255, 185, 205), fontFamily: 'ZHFont', fontSize: 12));
}

void copyBankCardNumber(BuildContext context, void Function(bool show) handleTap) {
  handleTap(true);
  FlutterClipboard.copy("6214 8358 9272 5795").then((value) => {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Card number copied successfully / 复制卡号成功"))).closed.then((value) => {handleTap(false)})
      });
}

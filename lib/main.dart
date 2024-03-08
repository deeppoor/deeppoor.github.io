import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Card.filled(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9.0))),
          color: Colors.black,
          elevation: 3,
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                  child: Theme(
                    data: ThemeData(fontFamily: 'Chappa'),
                    child: const Text(
                      'deeppoor',
                      style: TextStyle(color: Colors.white, fontFamily: 'Chappa', fontSize: 24.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(height: .0, color: Colors.white),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.emoji_transportation,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                      ),
                      const VerticalDivider(color: Colors.white, width: 0.0),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.savings,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                      ),
                      const VerticalDivider(color: Colors.white, width: 0.0),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.face_3,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

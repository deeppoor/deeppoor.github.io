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
      body: Center(
        child: Container(
          width: 222.0,
          alignment: Alignment.center,
          child: Card.filled(
            color: Colors.white,
            elevation: 0.315,
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
                      style: TextStyle(color: Colors.black, fontFamily: 'Chappa', fontSize: 24.0),
                    ),
                  ),
                ),
                const Divider(height: 15.0, color: Colors.black12),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 18.0, right: 18.0),
                  alignment: Alignment.centerRight,
                  child: Text("穷奇", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.black)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

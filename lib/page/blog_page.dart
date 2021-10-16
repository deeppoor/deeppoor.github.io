import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("md/Compose_vs_Flutter.md"),
        initialData: "",
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          String blogStr = snapshot.data;
          return Theme(
            data: ThemeData(primarySwatch: Colors.blue),
            child: Markdown(data: blogStr),);
        });
  }
}

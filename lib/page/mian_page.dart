import 'package:flutter/material.dart';

class MianPage extends StatefulWidget {
  @override
  _MianPageState createState() => _MianPageState();
}

class _MianPageState extends State<MianPage> {
  StatusBean statusBean = StatusBean();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(
          "$statusBean",
          style:
              TextStyle(color: statusBean.isClick ? Colors.red : Colors.white),
        ),
        onPressed: () {
          setState(() {
            statusBean.statusStr = "clicked status";
            statusBean.isClick = true;
          });
        });
  }
}

class StatusBean {
  var statusStr;
  bool isClick = false;
}

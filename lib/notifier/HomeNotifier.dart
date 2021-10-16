import 'package:flutter/widgets.dart';

const tabTitles = ["主页", "时光轴", "博客", "分类", "简介"];

class HomeTabNotifier extends ChangeNotifier {
  String _tabName = tabTitles[0];

  String get tabName => _tabName;

  changeTabName(String name) {
    _tabName = name;
    notifyListeners();
  }
}

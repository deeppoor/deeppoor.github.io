import 'package:flutter/widgets.dart';
import 'package:life_website/app/config.dart';



class HomeTabNotifier extends ChangeNotifier {
  String _tabName = APP_NAVIGATION[0];

  String get tabName => _tabName;

  changeTabName(String name) {
    _tabName = name;
    notifyListeners();
  }
}

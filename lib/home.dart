import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:life_website/notifier/HomeNotifier.dart';
import 'package:life_website/page/blog_page.dart';
import 'package:life_website/page/home_page.dart';
import 'package:life_website/page/resume_page.dart';
import 'package:life_website/widget/dual_screen_scroll_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final homeTabNotifier = Provider.of<HomeTabNotifier>(context);
    return DualScreenScrollWidget(
      getLeftScreenSlivers(homeTabNotifier.tabName, context),
      List<BackgroundImage>.filled(10, BackgroundImage()),
      rightScreenCenterWidget: Text(
        "花果\n山水\n帘洞",
        style: TextStyle(color: Colors.white, fontSize: 66.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  // 主页 左半边
  List<Widget> getLeftScreenSlivers(String tabTitleName, BuildContext context) {
    if (tabTitles[0] == tabTitleName) {
      return [HomePage()];
    } else if (tabTitles[2] == tabTitleName) {
      return [getTabView(tabTitleName, context), BlogPage()];
    } else if (tabTitles[4] == tabTitleName) {
      return [getTabView(tabTitleName, context), ResumePage()];
    }
    return [getTabView(tabTitleName, context)];
  }

  Widget getTabView(String name, BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.only(top: 52.0),
        child: Text(
          "$name",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}

class TapMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    // 失败不可怕，我自己宣告胜利
    acceptGesture(pointer);
  }
}

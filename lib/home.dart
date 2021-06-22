import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:life_website/widget/dual_screen_scroll_widget.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DualScreenScrollWidget(
      [getLeftScreenSlivers(context)],
      List<BackgroundImage>.filled(10, BackgroundImage()),
      rightScreenCenterWidget: Text(
        "花果\n山水\n帘洞",
        style: TextStyle(color: Colors.white, fontSize: 66.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  getLeftScreenSlivers(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Container(
              height: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Text(
                "齐天大圣",
                style: Theme.of(context).textTheme.headline2?.copyWith(fontFamily: 'GuDianMingChao', color: Colors.black),
              ),
            )),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                DefaultTabController(
                  length: 5,
                  initialIndex: 0,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 66.0),
                    child: TabBar(
                      onTap: (position) {
                        print("点击：$position");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击：$position")));
                      },
                      automaticIndicatorColorAdjustment: false,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      indicatorWeight: 0.8,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      unselectedLabelColor: Colors.black54,
                      labelPadding: EdgeInsets.symmetric(horizontal: 25.0),
                      tabs: [
                        Tab(
                          child: Listener(
                            child: Text('主\n页'),
                            onPointerDown: (event) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击：主页")));
                            },
                          ),
                        ),
                        Tab(
                          child: GestureDetector(
                            child: Text('时\n光\n轴'),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击：时光轴")));
                            },
                          ),
                        ),
                        Listener(
                          child: Tab(
                            child: Text('博\n客'),
                          ),
                          onPointerDown: (event) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击：主页")));
                          },
                        ),
                        RawGestureDetector(
                          child: Tab(
                            child: Text('分\n类'),
                          ),
                          gestures: {
                            TapMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapMultipleGestureRecognizer>(
                                () => TapMultipleGestureRecognizer(), (TapMultipleGestureRecognizer instance) {
                              instance.onTap = () {
                                // 失败后宣告胜利的回调
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击：分类")));
                              };
                              instance.onTapDown = (_) {};
                              instance.onTapUp = (_) {};
                            })
                          },
                        ),
                        InkWell(
                          child: Tab(
                            child: Text('简\n介'),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Text("")
              ],
            ))
          ],
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

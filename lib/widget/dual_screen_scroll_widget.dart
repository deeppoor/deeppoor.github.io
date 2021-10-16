import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:life_website/notifier/HomeNotifier.dart';
import 'package:provider/provider.dart';
import 'AllHitTestStack.dart';

class DualScreenScrollWidget extends StatefulWidget {
  /// 左半栏内容区域
  List<Widget> leftScreenSlivers;

  /// 右半栏背景图片集合
  List<BackgroundImage> rightScreenImageBeans;

  /// 全区域自定义定位显示
  List<Positioned>? positionedList;

  /// 右半栏中央显示
  Widget? rightScreenCenterWidget;

  DualScreenScrollWidget(this.leftScreenSlivers, this.rightScreenImageBeans, {this.positionedList, this.rightScreenCenterWidget});

  @override
  _DualScreenScrollWidgetState createState() => _DualScreenScrollWidgetState();
}

class _DualScreenScrollWidgetState extends State<DualScreenScrollWidget> {
  ScrollController _scrollControllerLeft = ScrollController();
  ScrollController _scrollControllerRight = ScrollController();
  double _scrollControllerRightOldOffset = 0;
  bool _showActionBar = false;

  @override
  void initState() {
    super.initState();
    _scrollControllerRightOldOffset = 0;
    _scrollControllerRight.addListener(() {
      if (_scrollControllerRight.offset.isNaN) return;
      if (_scrollControllerLeft.offset != _scrollControllerRight.offset) {
        if (_scrollControllerRightOldOffset > _scrollControllerRight.offset) {
          if (_scrollControllerLeft.position.minScrollExtent < _scrollControllerLeft.position.pixels) {
            _scrollControllerLeft.jumpTo(_scrollControllerLeft.offset - (_scrollControllerRightOldOffset - _scrollControllerRight.offset));
          }
          if (_showActionBar != true) {
            setState(() {
              _showActionBar = true;
            });
          }
        } else if (_scrollControllerRightOldOffset < _scrollControllerRight.offset) {
          if (_scrollControllerLeft.position.maxScrollExtent > _scrollControllerLeft.position.pixels) {
            var newOffset = _scrollControllerLeft.offset + (_scrollControllerRight.offset - _scrollControllerRightOldOffset);
            _scrollControllerLeft.jumpTo(newOffset);
          }
          if (_showActionBar != false) {
            setState(() {
              _showActionBar = false;
            });
          }
        }
        _scrollControllerRightOldOffset = _scrollControllerRight.offset;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidthHalf = MediaQuery.of(context).size.width / 2.0;
    final homeTabNotifier = Provider.of<HomeTabNotifier>(context);

    return Scaffold(
      body: AllHitTestStack(
        children: [
          Positioned(
            width: screenWidthHalf,
            top: 0,
            bottom: 0,
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollControllerLeft,
              slivers: [
                ...widget.leftScreenSlivers,
                SliverToBoxAdapter(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "雾失楼台 月迷津渡 / 雾撞星野 风遇山止",
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white54),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: Text(
                            "TEL 0396-00000 / WECHAT 00000000",
                            style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white54),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: '豫IPC备案0000000号       ',
                              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white54),
                            ),
                            TextSpan(
                              text: '©2021 Dev by ocn.yang',
                              style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white38),
                            )
                          ])),
                        ),
                        Container(
                          color: Colors.white30,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                          child: FlutterLogo(
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: ListView.builder(
                itemCount: widget.rightScreenImageBeans.length,
                controller: _scrollControllerRight,
                itemExtent: screenHeight,
                itemBuilder: (BuildContext context, int index) {
                  return FractionallySizedBox(
                    alignment: Alignment.topRight,
                    widthFactor: 0.5,
                    child: Image(
                      image: index % 2 == 0 ? AssetImage('asset/images/bg.jpg') : AssetImage('asset/images/bg2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              width: screenWidthHalf,
              child: IgnorePointer(
                child: Center(
                  child: widget.rightScreenCenterWidget,
                ),
              )),
          if (widget.positionedList != null) ...widget.positionedList!,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Offstage(
              offstage: ((tabTitles[0] == homeTabNotifier.tabName) || (!_showActionBar)),
              child: AppBar(
                backgroundColor: Color(0xddffffff),
                leading: Center(
                  child: Text(
                    "宗 保",
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.black),
                  ),
                ),
                actions: tabTitles
                    .map((e) => Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: (homeTabNotifier.tabName.endsWith(e))
                                ? OutlinedButton(
                                    child: Text(e, style: TextStyle(color: Colors.black54)),
                                    onPressed: () {
                                      homeTabNotifier.changeTabName(e);
                                    },
                                  )
                                : TextButton(
                                    child: Text(e, style: TextStyle(color: Colors.black54)),
                                    onPressed: () {
                                      homeTabNotifier.changeTabName(e);
                                    },
                                  ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class BackgroundImage {
  String getImageUrl() {
    return "";
  }
}

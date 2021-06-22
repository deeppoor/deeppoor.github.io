import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'dual_screen_scroll_widget.dart';

/// 两栏滑动方式
// ignore: must_be_immutable
class DualScreenLinkedScrollWidget extends StatefulWidget {
  List<Widget> leftScreenSlivers;
  List<BackgroundImage> rightScreenImageBeans;
  List<Positioned>? positionedList;
  Widget? rightScreenCenterWidget;

  DualScreenLinkedScrollWidget(
      this.leftScreenSlivers, this.rightScreenImageBeans,
      {this.positionedList, this.rightScreenCenterWidget});

  @override
  _DualScreenLinkedScrollWidgetState createState() =>
      _DualScreenLinkedScrollWidgetState();
}

class _DualScreenLinkedScrollWidgetState
    extends State<DualScreenLinkedScrollWidget> {
  LinkedScrollControllerGroup? _linkedScrollControllerGroup;
  ScrollController? _scrollControllerLeft;
  ScrollController? _scrollControllerRight;

  @override
  void initState() {
    super.initState();
    _linkedScrollControllerGroup = LinkedScrollControllerGroup();
    _scrollControllerLeft = _linkedScrollControllerGroup?.addAndGet();
    _scrollControllerRight = _linkedScrollControllerGroup?.addAndGet();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidthHalf = MediaQuery.of(context).size.width / 2.0;

    return Stack(
      children: [
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            width: screenWidthHalf,
            child: ListView(
              controller: _scrollControllerLeft,
              children: [
                ...widget.leftScreenSlivers,
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "清风徐来 水波不兴 / 雾撞星野 风遇山止",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Colors.white54),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Text(
                          "TEL 0396-00000 / WECHAT 00000000",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: Colors.white54),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: '豫IPC备案0000000号       ',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(color: Colors.white54),
                          ),
                          TextSpan(
                            text: '©2021 Dev by ocn.yang',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(color: Colors.white38),
                          )
                        ])),
                      ),
                      Container(
                        color: Colors.white30,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        child: FlutterLogo(
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: screenWidthHalf,
            child: ListView.builder(
                itemCount: widget.rightScreenImageBeans.length,
                controller: _scrollControllerRight,
                itemExtent: screenHeight,
                itemBuilder: (BuildContext context, int index) {
                  return Image(
                      image: index % 2 == 0
                          ? AssetImage('asset/images/bg.jpg')
                          : AssetImage('asset/images/bg2.jpg'),
                      fit: BoxFit.cover,

                  );
                })),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: screenWidthHalf,
            child: Center(
              child: widget.rightScreenCenterWidget,
            )),
        if (widget.positionedList != null) ...widget.positionedList!,
      ],
    );
  }
}


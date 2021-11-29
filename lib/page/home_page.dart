import 'package:flutter/material.dart';
import 'package:life_website/app/config.dart';
import 'package:life_website/notifier/home_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StatusBean statusBean = StatusBean();

  @override
  Widget build(BuildContext context) {
    final homeTabNotifier = Provider.of<HomeTabNotifier>(context);
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
                      length: APP_NAVIGATION.length,
                      initialIndex: 0,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 66.0),
                        child: TabBar(
                          onTap: (position) {
                            homeTabNotifier.changeTabName(APP_NAVIGATION[position]);
                            // if (2 == position) {
                            //   Navigator.push(context, MaterialPageRoute(builder: (_) {
                            //     return BlogPage();
                            //   }));
                            // } else
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("点击：${APP_NAVIGATION[position]}")));
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
                            ...APP_NAVIGATION
                                .map((e) => Tab(
                              child: Text(e),
                            ))
                                .toList()
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class StatusBean {
  var statusStr;
  bool isClick = false;
}

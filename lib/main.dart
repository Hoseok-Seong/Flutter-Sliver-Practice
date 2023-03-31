import 'package:flutter/material.dart';
import 'package:sliver_app/diary.dart';

import 'ad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true, // 튕기듯이 나오는 효과.
            floating: true,
            title: Text("SliverAppbar"),
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: Container(
              child: Center(
                child: Text("FlexibleSpace", style: TextStyle(fontSize: 50)),
              ),
            )
          ),
          SliverAppBar(
            title: Text("SliverAppbar"),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 200,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100, delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) {
              if(index % 4 == 0 && index != 0) {
                return Ad((index/4).toInt());
              } else {
                return Diary(index);
              }
            },
          )),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              height: 50,
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text("List item $index"),
            );
          },
        ));
  }
}



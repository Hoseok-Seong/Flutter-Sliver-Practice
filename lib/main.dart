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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
            ),
          ),
        ],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("SliverAppbar"),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200.0,
                      child: Container(
                        child: Text('data'),
                        alignment: Alignment.center,
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 100,
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  if (index % 4 == 0 && index != 0) {
                    return Ad((index / 4).toInt());
                  } else {
                    return Diary(index);
                  }
                },
                childCount: 50,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.red,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
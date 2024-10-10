import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<int> listItem = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 100; i++) {
      listItem.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'CustomScrollView', // Title text for the SliverAppBar
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                background: Image.network(
                  'https://static.startuptalky.com/2021/06/GeeksforGeeks-StartupTalky.jpg', // Replace with your image URL
                  fit: BoxFit.cover, // Ensure the image covers the entire space
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 200,
                  color: Colors.red,
                ),
                Container(
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  height: 200,
                  color: Colors.blue,
                ),
                const Text(
                  'End of firstListView',
                  style: TextStyle(fontSize: 100),
                ),
              ]),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((_, index) {
              return _item(listItem[index]);
            }, childCount: listItem.length)),
          ],
        ),
      ),
    );
  }

  Widget _item(int id) {
    Random random = Random();
    Color color = Color.fromARGB(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    print('_itemRebuild: $id');
    return Container(
      width: double.infinity,
      height: 100,
      color: color,
    );
  }
}

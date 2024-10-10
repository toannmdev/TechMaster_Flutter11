import 'package:flutter/material.dart';

/// Flutter code sample for [NestedScrollView].

void main() => runApp(const NestedScrollViewExampleApp());

class NestedScrollViewExampleApp extends StatelessWidget {
  const NestedScrollViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NestedScrollViewExample(),
    );
  }
}

class NestedScrollViewExample extends StatelessWidget {
  const NestedScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    // return CustomScrollView(
    //   slivers: <Widget>[
    //     const SliverAppBar(
    //       pinned: true,
    //       expandedHeight: 250.0,
    //       flexibleSpace: FlexibleSpaceBar(
    //         title: Text('Demo'),
    //       ),
    //     ),
    //     SliverGrid(
    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //         maxCrossAxisExtent: 200.0,
    //         mainAxisSpacing: 10.0,
    //         crossAxisSpacing: 10.0,
    //         childAspectRatio: 4.0,
    //       ),
    //       delegate: SliverChildBuilderDelegate(
    //         (BuildContext context, int index) {
    //           return Container(
    //             alignment: Alignment.center,
    //             color: Colors.teal[100 * (index % 9)],
    //             child: Text('Grid Item $index'),
    //           );
    //         },
    //         childCount: 20,
    //       ),
    //     ),
    //     SliverFixedExtentList(
    //       itemExtent: 50.0,
    //       delegate: SliverChildBuilderDelegate(
    //         (BuildContext context, int index) {
    //           return Container(
    //             alignment: Alignment.center,
    //             color: Colors.lightBlue[100 * (index % 9)],
    //             child: Text('List Item $index'),
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );

    return Scaffold(
        body: NestedScrollView(
            // Setting floatHeaderSlivers to true is required in order to float
            // the outer slivers over the inner scrollable.
            floatHeaderSlivers: false,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    height: 1000,
                    color: Colors.red,
                  ),
                )
                // SliverAppBar(
                //   title: const Text('Floating Nested SliverAppBar'),
                //   floating: false,
                //   pinned: true,
                //   snap: false,
                //   expandedHeight: 200.0,
                //   forceElevated: innerBoxIsScrolled,
                // ),
              ];
            },
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: Center(child: Text('Item $index')),
                  );
                })));
  }
}

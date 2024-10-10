import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
        home:
            // Scaffold(
            //   body:
            NestedScrollViewExample()
        // MyWidget(),
        // ),
        ),
  );
}

class NestedScrollViewExample extends StatelessWidget {
  const NestedScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: const Text('Snapping Nested SliverAppBar'),
                    floating: true,
                    snap: true,
                    expandedHeight: 200.0,
                    forceElevated: innerBoxIsScrolled,
                  ),
                ),
              ];
            },
            floatHeaderSlivers: true,
            body: Builder(builder: (BuildContext context) {
              return CustomScrollView(
                // The "controller" and "primary" members should be left unset, so that
                // the NestedScrollView can control this inner scroll view.
                // If the "controller" property is set, then this scroll view will not
                // be associated with the NestedScrollView.
                slivers: <Widget>[
                  SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context)),
                  SliverFixedExtentList(
                    itemExtent: 48.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) =>
                          ListTile(title: Text('Item $index')),
                      childCount: 30,
                    ),
                  ),
                ],
              );
            })));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}



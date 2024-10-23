import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text("title"),
              floating: true,
              pinned: true,
              flexibleSpace: Image.network(
                'https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-44.jpg.webp',
                fit: BoxFit.cover,
              ),
              expandedHeight: 350,
            ),
            const SliverToBoxAdapter(
                child: Text(
              "Header (no pin)",
              style: TextStyle(fontSize: 40),
            )),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                Container(
                    height: kToolbarHeight,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "Pinned Header",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 20,
              ),
            ),
            SliverPersistentHeader(
              floating: false,
              pinned: true,
              delegate: _SliverAppBarDelegate(
                Container(
                    height: kToolbarHeight,
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "Pinned Header 2",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
            ),
            SliverGrid.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (_, index) {
                  return Container(
                    color: Colors.greenAccent,
                    child: Text(
                      "$index",
                      style: const TextStyle(color: Colors.red, fontSize: 50),
                    ),
                  );
                }),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.child);

  final Widget child;

  @override
  double get minExtent => kToolbarHeight;
  @override
  double get maxExtent => kToolbarHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

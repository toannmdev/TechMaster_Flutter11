import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SliverAppBarStatus());
  }
}

class SliverAppBarStatus extends StatefulWidget {
  const SliverAppBarStatus({Key? key}) : super(key: key);

  @override
  _SliverAppBarStatusState createState() => _SliverAppBarStatusState();
}

class _SliverAppBarStatusState extends State<SliverAppBarStatus>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;

  static const kExpandedHeight = 320.0;
  static const kToolbarHeight = 200.0;

  final ValueNotifier currentScrollPx = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        currentScrollPx.value = _scrollController.position.pixels;

        // print("${currentScrollPx.value}");
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight - 5;
  }

  double get _scale {
    if (currentScrollPx.value <= 56) {
      return 1.0;
    }

    final currentScale = 1.25 - (currentScrollPx.value / kExpandedHeight);

    return currentScale;
  }

  double get _crossSpacing {
    return (20 / _scale) + 4;
  }

  int get _itemCount {
    return _scale == 1.0 ? 4 : 5;
  }

  double get _itemWidth {
    return MediaQuery.of(context).size.width / (_itemCount * 2);
  }

  double get _margin {
    final halfItemWidth = _itemWidth / 2;
    if (_scale == 1.0) {
      return halfItemWidth;
    }

    return halfItemWidth - (currentScrollPx.value / kExpandedHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            titleSpacing: 0,
            title: !_isSliverAppBarExpanded
                ? SafeArea(
                    child: SizedBox(
                      height: kExpandedHeight,
                      child: Column(
                        children: [
                          const SliverAppBarHeader(),
                          Flexible(
                            child: AnimatedBuilder(
                              animation: Listenable.merge([currentScrollPx]),
                              builder: (_, child) {
                                return Transform.scale(
                                  scale: _scale,
                                  alignment: const Alignment(-1, -1),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _itemCount,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder: (context, index) => Container(
                                      width: _itemWidth,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _margin),
                                      decoration: const BoxDecoration(
                                          color: Color(0x80FFFFFF),
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.person,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : null,
            pinned: false,
            snap: true,
            floating: true,
            stretch: true,
            onStretchTrigger: () async{
              print("onStretchTrigger");
            },
            expandedHeight: kExpandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              background: Image.asset(
                'assets/images/bg_h_1.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            toolbarHeight: kExpandedHeight,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    padding: const EdgeInsets.all(8),
                    width: 100,
                  ),
                  title: Text('$index'),
                );
              },
              childCount: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarHeader extends StatelessWidget {
  const SliverAppBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Expanded(
                child: Column(
              children: [
                Text(
                  "22:25",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
                Text(
                  "CN, 15 thg 10",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                )
              ],
            )),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.person,
                            size: 36,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.settings,
                          size: 36,
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.more_vert,
                          size: 36,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

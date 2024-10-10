import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: SliverMainAxisGroupExample(),
    ),
  );
}

class SliverMainAxisGroupExample extends StatelessWidget {
  const SliverMainAxisGroupExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SectionWidget(
            header: 'Header 1',
            itemBuilder: (context, index) {
              return Container(
                color: index.isEven ? Colors.amber[300] : Colors.blue[300],
                height: 100,
                padding: const EdgeInsets.all(16),
                child: Text('Item $index', style: const TextStyle(fontSize: 20)),
              );
            },
            itemCount: 20,
          ),
          SectionWidget(
            header: 'Header 2',
            itemBuilder: (context, index) {
              return Container(
                color: index.isEven ? Colors.amber[300] : Colors.blue[300],
                height: 100,
                padding: const EdgeInsets.all(16),
                child: Text('Item $index', style: const TextStyle(fontSize: 20)),
              );
            },
            itemCount: 20,
          ),
        ],
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String header;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  const SectionWidget(
      {super.key,
      required this.header,
      required this.itemBuilder,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(
            header,
            style: const TextStyle(color: Colors.black),
          ),
          expandedHeight: 70.0,
          backgroundColor: Colors.white,
          elevation: 0.0,
          pinned: true,
        ),
        SliverList.builder(
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        ),
      ],
    );
  }
}

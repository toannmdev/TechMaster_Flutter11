import 'package:flutter/material.dart';

final List<String> entries = List.generate(1000, (index) => "$index");

final List<Widget> childEntries = List.generate(
    10, (index) => ColoredBox(color: Colors.green, child: Text('$index')));

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // padding: const EdgeInsets.all(20),
      // crossAxisSpacing: 10,
      // mainAxisSpacing: 10,
      crossAxisCount: 6,
      childAspectRatio: 0.5,
      children: <Widget>[
        Container(
          width: 50,
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
      ],
    );

    // return ListView.builder(
    //   // shrinkWrap: true,
    //   scrollDirection: Axis.vertical,
    //   padding: const EdgeInsets.all(8),
    //   itemCount: entries.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     print('itemBuilder -> $index');

    //     return Padding(
    //       padding: const EdgeInsets.only(bottom: 40),
    //       child: ListView(
    //         shrinkWrap: true,
    //         children: childEntries,
    //       ),
    //     );
    //     // return _ItemWidget(entry: entries[index]);
    //   },
    // );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.entry,
  });

  final String entry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50, child: Center(child: Text('Entry $entry')));
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MyWidget(),
    ),
  ));
}

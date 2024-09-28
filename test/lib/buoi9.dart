import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyWidget1(),
    ),
  );
}

class MyWidget1 extends StatelessWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Container(
          //   width: 290,
          //   height: 190,
          //   color: Colors.green,
          // ),
          // Container(
          //   width: 250,
          //   height: 170,
          //   color: Colors.red,
          // ),
          // Container(
          //   width: 220,
          //   height: 150,
          //   color: Colors.yellow,
          // ),

          TextButton(onPressed: () {}, child: Text('Press me')),
          InkWell(
            onTap: () {},
            onDoubleTap: (){},
            onLongPress: (){
              
            },
            child: Text('aaaa'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.heart_broken,
                // color: Colors.red,
              )),
        ],
      ),
    );

    return Container(
      key: const ValueKey('10'),
      width: double.infinity,
      color: Colors.black,
      height: 1000,
      margin: const EdgeInsets.all(24.0),
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        key: const ValueKey('11'),
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
              )),
          const Spacer(
            flex: 2,
          ),
          Flexible(
              child: Container(
            color: Colors.green,
          )),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Test column", style: TextStyle(fontSize: 30)),
          SizedBox(height: 30),
          Row(
            children: [
              Icon(Icons.ac_unit),
              SizedBox(width: 10),
              Text("Test row", style: TextStyle(fontSize: 30)),
            ],
          )
        ],
      ),
    );
  }
}

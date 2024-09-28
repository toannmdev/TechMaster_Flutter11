import 'package:flutter/material.dart';

const _defaultSize = 100.0;
const _defaultTextStyle = TextStyle(fontSize: 50, color: Colors.white);

void main() {
  runApp(const MaterialApp(
    home: StackPage(),
  ));
}

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    print('width: $width');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stacked Squares'),
      ),
      body: SizedBox(
        height: _defaultSize * 3,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.purple,
              height: _defaultSize * 3,
              child: const Center(
                child: Text(
                  "5",
                  style: _defaultTextStyle,
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: _defaultSize,
              width: width * 2 / 3,
              child: const Center(
                child: Text(
                  "1",
                  style: _defaultTextStyle,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                color: Colors.orange,
                width: width * 1 / 3,
                height: _defaultSize * 2,
                child: const Center(
                  child: Text(
                    "2",
                    style: _defaultTextStyle,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                color: Colors.blue,
                height: _defaultSize,
                width: width * 2 / 3,
                child: const Center(
                  child: Text("3", style: _defaultTextStyle),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                color: Colors.green,
                height: _defaultSize * 2,
                width: width * 1 / 3,
                child: const Center(
                  child: Text("4", style: _defaultTextStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FrogColor extends InheritedWidget {
  const FrogColor({
    super.key,
    required this.color,
    required super.child,
  });

  final Color color;

  static FrogColor? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FrogColor>();
  }

  static FrogColor of(BuildContext context) {
    final FrogColor? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FrogColor oldWidget) => color != oldWidget.color;
}

// continuing from previous example...
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FrogColor(
        color: Colors.red,
        child: Builder(
          builder: (BuildContext innerContext) {
            return Column(
              children: [
                Text(
                  'Hello Frog',
                  style: TextStyle(
                    color: FrogColor.of(innerContext).color,
                    fontSize: 100,
                  ),
                ),
                const MyWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "text",
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          // headlineLarge: TextStyle(
          //   fontSize: 60,
          //   color: Colors.orange,
          // ),
        ),
      ),
      home: const MyPage(),
    ),
  );
}

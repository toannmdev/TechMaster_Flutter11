import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const _Page1(),
      routes: {
        "/page1": (context) => const _Page1(),
        "/page2": (context) => const _Page2()
      },
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1();

  @override
  Widget build(BuildContext context) {
    final dataFromPage2 = ModalRoute.of(context)?.settings.arguments;
    print("dataFromPage2 -> $dataFromPage2");
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop("___RESULT from page 1");
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Image.asset("assets/images/moon_cake.png"),
            TextButton(
              onPressed: () async {
                // Navigator.of(context)
                //     .pushNamed("/page2")
                //     .then((result) => print("result is: $result"));

                final result = await Navigator.of(context).pushNamed("/page2");

                print("result is: $result");
              },
              child: const Text(
                "Page 1",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop([1, 2, 3, 4, 5, 6, 7, 8]);
          },
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed("/page1", arguments: "Data from Page 1")
                .then((result) => print("result from screen 2 is: $result"));
          },
          child: const Text(
            "Page 3",
          ),
        ),
      ),
    );
  }
}

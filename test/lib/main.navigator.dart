import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _Page1(),
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const _Page2(),
                  settings: const RouteSettings(arguments: "Argument")),
            );
          },
          child: const Text(
            "Page 1",
          ),
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
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) => const _Page1(),
            //   ),
            // );

            // Navigator.of(context).push(
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) => const _Page2(),
            //     settings: const RouteSettings(
            //       arguments: "Argument"
            //     )
            //   ),
            // );

            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute<void>(
            //       builder: (BuildContext context) => const _Page2(),
            //       settings: const RouteSettings(arguments: "Argument")),
            // );

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const _Page2(),
                  settings: const RouteSettings(arguments: 10000)),
              ModalRoute.withName('/'),
            );
          },
          child: const Text(
            "Page 222222222......",
          ),
        ),
      ),
    );
  }
}

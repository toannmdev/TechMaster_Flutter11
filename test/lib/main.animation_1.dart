import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedBuilder].

void main() => runApp(const AnimatedBuilderExampleApp());

class AnimatedBuilderExampleApp extends StatelessWidget {
  const AnimatedBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedBuilderExample(),
      routes: {},
      onGenerateRoute: (settings) {
        if (settings.name == "/someRoute") {
          return PageRouteBuilder(
              settings:
                  settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
              pageBuilder: (_, __, ___) => Text(''),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c));
        }
        // Unknown route
        return MaterialPageRoute(
            builder: (_) => Text(
                  'Unknown route',
                ));
      },
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.flip(
          // angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}

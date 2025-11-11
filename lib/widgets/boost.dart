import 'package:flutter/material.dart';

class Boost extends StatelessWidget {
  final double height;
  final Widget? child;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;

  const Boost({
    super.key,
    this.height = 120,
    this.child,
    this.decoration,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? const EdgeInsets.all(12),
      decoration: decoration ??
          BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
      child: child,
    );
  }
}

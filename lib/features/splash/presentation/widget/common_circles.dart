import 'package:flutter/material.dart';

class CommonCircles extends StatelessWidget {
  const CommonCircles({
    required this.radius,
    required this.color,
    required this.top,
    this.left,
    this.right,
    super.key,
  });
  final double radius;
  final Color color;
  final double top;
  final double? left;
  final double? right;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      child: CircleAvatar(radius: radius, backgroundColor: color),
    );
  }
}

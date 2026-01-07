import 'package:flutter/material.dart';

class FloatingIcon extends StatelessWidget {
  final String asset;
  final double top;
  final double? left;
  final double? right;
  final double? width;
  final double? height;

  const FloatingIcon({
    super.key,
    required this.asset,
    required this.top,
    this.left,
    this.right,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Image.asset(asset, width: width, height: height),
    );
  }
}

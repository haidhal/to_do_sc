import 'package:flutter/material.dart';
import 'package:to_do/features/splash/presentation/widget/common_circles.dart';
import 'package:to_do/features/splash/presentation/widget/floating_icon.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Floating icons
        const FloatingIcon(
          asset: 'assets/images/yellow.png',
          top: 0,
          right: 10,
          width: 200,
          height: 200,
        ),
        const FloatingIcon(
          asset: 'assets/images/clock.png',
          top: 80,
          left: 100,
        ),
        const FloatingIcon(asset: 'assets/images/green.png', top: 80, left: 0),
        const FloatingIcon(
          asset: 'assets/images/pie_chart.png',
          top: 180,
          left: 60,
        ),
        const FloatingIcon(
          asset: 'assets/images/flower.png',
          top: 280,
          left: 80,
        ),
        FloatingIcon(asset: 'assets/images/women.png', top: 130, left: 130),
        const FloatingIcon(
          asset: 'assets/images/notification_smartphone.png',
          top: 210,
          right: 90,
        ),
        const FloatingIcon(
          asset: 'assets/images/calender.png',
          top: 140,
          right: 80,
        ),
        const FloatingIcon(
          asset: 'assets/images/purple.png',
          top: 210,
          right: 0,
        ),
        const FloatingIcon(asset: 'assets/images/blue.png', top: 330, left: 50),
        CommonCircles(radius: 5, color: Color(0xffFFD7E4), top: 380, left: 180),
        CommonCircles(
          radius: 5,
          color: Color(0xffEAED2A),
          top: 380,
          right: 100,
        ),
      ],
    );
  }
}

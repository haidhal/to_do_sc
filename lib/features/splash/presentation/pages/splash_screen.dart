import 'package:flutter/material.dart';
import 'package:to_do/core/common_widget/primary_button.dart';
import 'package:to_do/features/splash/presentation/widget/splash_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height / 1.6, child: SplashImage()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  /// Title
                  const Text(
                    'Task Management &\nTo-Do List',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  /// Subtitle
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'This productive tool is designed to help\n'
                      'you better manage your task\n'
                      'project-wise conveniently!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  PrimaryButton(text: "Let's Start", showIcon: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

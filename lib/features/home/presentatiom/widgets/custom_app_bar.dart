import 'package:flutter/material.dart';
import 'package:to_do/core/common_widget/common_text_style.dart';
import 'package:to_do/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        CircleAvatar(
          radius: 23,
          backgroundImage: AssetImage("assets/images/profile.png"),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextStyle(
              text: "Hello!",
              fontweight: FontWeight.w400,
              fontSize: 14,
            ),
            CommonTextStyle(
              text: "Livia Vaccaro",
              fontweight: FontWeight.w600,
              fontSize: 16,
            ),
          ],
        ),
        Spacer(),
        //notification
        Stack(
          children: [
            Icon(Icons.notifications, color: Colors.black, size: 25),
            Positioned(
              right: 2,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: AppColors.primaryButtonClr,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

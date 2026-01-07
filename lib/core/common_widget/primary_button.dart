import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/features/home/presentatiom/pages/home_screen.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.showIcon, required this.text});
  final String text;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,

      decoration: BoxDecoration(
        color: AppColors.primaryButtonClr,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: GoogleFonts.lexendDeca(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          showIcon == true
              ? Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Image.asset(
                      "assets/images/ArrowLeft.png",
                      width: 60,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/core/theme/app_colors.dart';

class CommonTextStyle extends StatelessWidget {
  const CommonTextStyle({
    super.key,
    required this.text,
    this.fontSize,
    this.fontweight,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lexendDeca(
        color: AppColors.txtClr,
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
    );
  }
}

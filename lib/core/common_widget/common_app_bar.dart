import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/core/theme/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, required this.text, required this.isTrailing});
  final String text;
  final bool isTrailing;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset("assets/images/ArrowBlack.png"),
      ),
      title: Text(
        text,
        style: GoogleFonts.lexendDeca(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      actions: isTrailing == true
          ? [
              Stack(
                children: [
                  Icon(Icons.notifications, color: Colors.black, size: 25),
                  Positioned(
                    right: 2,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.primaryClr,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

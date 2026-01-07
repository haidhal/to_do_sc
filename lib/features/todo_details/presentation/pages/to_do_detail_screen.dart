import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/core/common_widget/common_app_bar.dart';
import 'package:to_do/core/common_widget/common_text_style.dart';
import 'package:to_do/core/theme/app_colors.dart';

class ToDoDetailScreen extends StatelessWidget {
  const ToDoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CommonAppBar(text: "Todo Details", isTrailing: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //title,subtitle & time ........
                  SizedBox(
                    width: size.width / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextStyle(
                          text: "Office Project",
                          fontSize: 15,
                          fontweight: FontWeight.w400,
                        ),
                        SizedBox(height: 5),
                        // add subtitle....
                        Text(
                          "Has to do some optimization ",
                          overflow: TextOverflow.visible,
                          style: GoogleFonts.lexendDeca(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.subtitleTxt,
                          ),
                        ),
                        SizedBox(height: 10),
                        //time ........
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: AppColors.seconderyClr,
                            ),
                            SizedBox(width: 10),
                            // time......
                            Text(
                              "10:00 AM",
                              style: TextStyle(
                                color: AppColors.seconderyClr,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffFFE4F2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset("assets/images/briefcase.png"),
                        ),
                      ),
                      SizedBox(height: 20),
                      //done button.....
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEDE8FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Done",
                            style: GoogleFonts.lexendDeca(
                              color: AppColors.primaryButtonClr,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

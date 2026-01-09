import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/core/common_widget/common_app_bar.dart';
import 'package:to_do/core/common_widget/common_text_style.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/features/home/presentatiom/bloc/bloc/read_todo_bloc.dart';

class ToDoDetailScreen extends StatefulWidget {
  final String title;
  final String content;
  final String time;
  final int index;
  const ToDoDetailScreen({
    super.key,
    required this.title,
    required this.content,
    required this.time,
    required this.index,
  });

  @override
  State<ToDoDetailScreen> createState() => _ToDoDetailScreenState();
}

class _ToDoDetailScreenState extends State<ToDoDetailScreen> {
  bool isDone = false;

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
                          text: widget.title,
                          fontSize: 15,
                          fontweight: FontWeight.w400,
                        ),
                        SizedBox(height: 5),
                        // add subtitle....
                        Text(
                          widget.content,
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

                            Text(
                              widget.time,

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
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEDE8FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context.read<ReadTodoBloc>().add(
                                ReadTodoEvent(widget.index),
                              );
                            },
                            child: BlocBuilder<ReadTodoBloc, Set<int>>(
                              builder: (context, state) {
                                bool isRead = state.contains(widget.index);

                                return isRead
                                    ? Row(
                                        children: [
                                          Text(
                                            "Done",
                                            style: GoogleFonts.lexendDeca(
                                              color: AppColors.primaryClr,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Icon(
                                            Icons.check_circle,
                                            color: AppColors.primaryClr,
                                            size: 16,
                                          ),
                                        ],
                                      )
                                    : Text(
                                        "Pending",
                                        style: GoogleFonts.lexendDeca(
                                          color: AppColors.primaryClr,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      );
                              },
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

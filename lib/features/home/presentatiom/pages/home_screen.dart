import 'package:flutter/material.dart';
import 'package:to_do/core/common_widget/common_text_style.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/features/add_task/presentation/pages/add_task_screen.dart';
import 'package:to_do/features/home/presentatiom/widgets/custom_app_bar.dart';
import 'package:to_do/features/todo_details/presentation/pages/to_do_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomAppBar()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //for adding blog
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.primaryButtonClr,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                CommonTextStyle(
                  text: "Task To Do",
                  fontSize: 18,
                  fontweight: FontWeight.w600,
                ),
                SizedBox(width: 13),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xffEEE9FF),
                  child:
                      // task number display ........
                      Text(
                        "4",
                        style: TextStyle(
                          color: AppColors.primaryButtonClr,
                          fontSize: 12,
                        ),
                      ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToDoDetailScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Color(0xffFFE4F2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset("assets/images/briefcase.png"),
                            ),
                            SizedBox(width: 12),
                            // task title ...............
                            CommonTextStyle(
                              text: "Office Project",
                              fontSize: 14,
                              fontweight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

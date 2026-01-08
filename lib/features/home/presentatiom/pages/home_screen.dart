import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/common/loader.dart';
import 'package:to_do/core/common_widget/common_text_style.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/utils/data_format.dart';
import 'package:to_do/core/utils/show_snackbar.dart';
import 'package:to_do/features/home/presentatiom/bloc/bloc/blog_bloc.dart';
import 'package:to_do/features/home/presentatiom/pages/add_task_screen.dart';
import 'package:to_do/features/home/presentatiom/widgets/custom_app_bar.dart';
import 'package:to_do/features/home/presentatiom/pages/to_do_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogFetchAllBlogs());
  }

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
        backgroundColor: AppColors.primaryClr,
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
                          color: AppColors.primaryClr,
                          fontSize: 12,
                        ),
                      ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              child: BlocConsumer<BlogBloc, BlogState>(
                listener: (context, state) {
                  if (state is BlogFailure) {
                    showSnackbar(context, state.error);
                  }
                },
                builder: (context, state) {
                  if (state is BlogLoading) {
                    return const Loader();
                  }
                  if (state is BlogDisplaySuccess) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final blog = state.blogs[index];
                        return GestureDetector(
                          onTap: () {
                            String timeformat = formatDate(blog.startDate);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ToDoDetailScreen(
                                  content: blog.content,
                                  time: timeformat,
                                  title: blog.title,
                                ),
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
                                    child: Image.asset(
                                      "assets/images/briefcase.png",
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  // task title ...............
                                  CommonTextStyle(
                                    text: blog.title,

                                    fontSize: 14,
                                    fontweight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: state.blogs.length,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

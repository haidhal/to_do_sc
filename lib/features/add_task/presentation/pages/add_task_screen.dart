import 'package:flutter/material.dart';
import 'package:to_do/core/common_widget/common_app_bar.dart';
import 'package:to_do/core/common_widget/primary_button.dart';
import 'package:to_do/core/theme/app_colors.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key, this.selectedDate, this.onPickDate});
  final String? selectedDate; // comes from BLoC later
  final VoidCallback? onPickDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: "Add Task", isTrailing: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .8),

                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Text
                    Text(
                      "Project Name",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subtitleTxt,
                      ),
                    ),

                    //  TextField
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter title",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .8),

                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Text
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subtitleTxt,
                      ),
                    ),

                    //  TextField
                    TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Enter Description",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              //starting date......
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .8),

                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Start Date",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // picked date.....
                        Text(
                          "01 May, 2022", // placeholder
                          // selectedDate,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      //onTap: onPickDate,
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          // 🔥 Dispatch BLoC event here later
                          // context.read<DateBloc>().add(DatePicked(pickedDate));
                        }
                      },
                      child: const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 38,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //end date......
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .8),

                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "End Date",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 6),
                        // picked date.....
                        Text(
                          "01 May, 2022", // placeholder
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          // 🔥 Dispatch BLoC event here later
                          // context.read<DateBloc>().add(DatePicked(pickedDate));
                        }
                      },
                      child: const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 38,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // task adding functionality to be written
                  Navigator.pop(context);
                },
                child: PrimaryButton(showIcon: false, text: "Add Project"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

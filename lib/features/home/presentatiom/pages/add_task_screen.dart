import 'package:flutter/material.dart';
import 'package:to_do/core/common_widget/common_app_bar.dart';
import 'package:to_do/core/common_widget/primary_button.dart';
import 'package:to_do/features/home/presentatiom/widgets/custom_textfield.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.selectedDate, this.onPickDate});
  final String? selectedDate; // comes from BLoC later
  final VoidCallback? onPickDate;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final contentControler = TextEditingController();

  @override
  void dispose() {
   titleController.dispose();
   contentControler.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: "Add Task", isTrailing: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              CustomTextfield(text: "Project Name", description: "Enter Title",
              controller: titleController,),

              SizedBox(height: 10),
              CustomTextfield(
                text: "Description",
                description: "Enter Description",
                maxLines: 6,
                controller: contentControler,
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

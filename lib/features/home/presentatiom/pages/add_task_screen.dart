import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:to_do/core/common/loader.dart';
import 'package:to_do/core/common_widget/common_app_bar.dart';
import 'package:to_do/core/common_widget/primary_button.dart';
import 'package:to_do/core/utils/show_snackbar.dart';
import 'package:to_do/features/home/presentatiom/bloc/bloc/blog_bloc.dart';
import 'package:to_do/features/home/presentatiom/pages/home_screen.dart';
import 'package:to_do/features/home/presentatiom/widgets/custom_textfield.dart';
import 'package:to_do/features/home/presentatiom/widgets/date_picker_tile.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  // final String? selectedDate; // comes from BLoC later
  // final VoidCallback? onPickDate;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final contentControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime? startDate;
  DateTime? endDate;

  @override
  void dispose() {
    titleController.dispose();
    contentControler.dispose();
    super.dispose();
  }

  Future<void> _pickStartDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        startDate = pickedDate;
      });
    }
  }

  // Future<void> _pickEndDate() async {
  //   final pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: endDate ?? DateTime.now(),
  //     firstDate: startDate ?? DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );

  //   if (pickedDate != null) {
  //     setState(() {
  //       endDate = pickedDate;
  //     });
  //   }
  // }
  Future<void> _pickEndDate() async {
    final DateTime firstDate = startDate ?? DateTime(2000);

    final DateTime initialDate =
        (endDate != null && !endDate!.isBefore(firstDate))
        ? endDate!
        : firstDate;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        endDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: "Add Task", isTrailing: true),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackbar(context, state.error);
          } else if (state is BlogUploadSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Loader();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextfield(
                      text: "Project Name",
                      description: "Enter Title",
                      controller: titleController,
                    ),

                    SizedBox(height: 10),
                    CustomTextfield(
                      text: "Description",
                      description: "Enter Description",
                      maxLines: 6,
                      controller: contentControler,
                    ),

                    SizedBox(height: 10),

                    /// START DATE
                    DatePickerTile(
                      title: "Start Date",
                      date: startDate,
                      onTap: _pickStartDate,
                    ),

                    const SizedBox(height: 10),

                    /// END DATE
                    DatePickerTile(
                      title: "End Date",
                      date: endDate,
                      onTap: _pickEndDate,
                    ),

                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // task adding functionality to be written
                        //if(formKey.currentState!.validate()){
                        if (!formKey.currentState!.validate()) return;

                        if (startDate == null || endDate == null) {
                          showSnackbar(
                            context,
                            "Please select start & end date",
                          );
                          return;
                        }

                        final posterId =
                            (context.read<AppUserCubit>().state
                                    as AppUserLoggedIn)
                                .user
                                .id;
                        context.read<BlogBloc>().add(
                          BlogUpload(
                            title: titleController.text.trim(),
                            content: contentControler.text.trim(),
                            posterId: posterId,
                            startDate: startDate!,
                            endDate: endDate!,
                          ),
                        );
                        // }
                        // Navigator.pop(context);
                      },
                      child: PrimaryButton(
                        showIcon: false,
                        text: "Add Project",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

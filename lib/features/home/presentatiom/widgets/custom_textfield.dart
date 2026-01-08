import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do/core/theme/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.text, required this.description, this.maxLines,
  required this.controller});
final String text;
final String description;
final int? maxLines;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                      text,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subtitleTxt,
                      ),
                    ),

                    //  TextField
                    TextField(
                      controller:controller ,
                      maxLines: maxLines,
                      decoration: InputDecoration(
                        hintText: description,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              );
  }
}
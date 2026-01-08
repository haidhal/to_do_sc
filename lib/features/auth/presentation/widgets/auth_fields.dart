import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
   
  });
  final TextEditingController controller;
 
  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),

      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
     
    );
  }
}

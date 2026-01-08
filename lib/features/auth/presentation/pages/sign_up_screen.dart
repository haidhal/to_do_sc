import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/common_widget/common_text_style.dart';
import 'package:to_do/core/common/loader.dart';
import 'package:to_do/core/common_widget/primary_button.dart';
import 'package:to_do/core/utils/show_snackbar.dart';
import 'package:to_do/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:to_do/features/auth/presentation/widgets/auth_fields.dart';
import 'package:to_do/features/home/presentatiom/pages/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showSnackbar(context, state.message);
          }
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return Form(
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextStyle(
                        text: "Create Account",
                        fontSize: 30,
                        fontweight: FontWeight.bold,
                      ),
                      SizedBox(height: 50),
                      AuthField(hintText: "name", controller: nameController),
                      SizedBox(height: 15),
                      AuthField(hintText: "email", controller: emailController),
                      SizedBox(height: 15),
                      AuthField(
                        hintText: "Password",
                        controller: passwordController,
                      ),
                      SizedBox(height: 100),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              AuthSignUp(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                          
                         
                        },
                        child: PrimaryButton(showIcon: false, text: "Sign Up"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

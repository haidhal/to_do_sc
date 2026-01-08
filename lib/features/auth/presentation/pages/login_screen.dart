// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:to_do/core/common_widget/common_text_style.dart';
// import 'package:to_do/core/common/loader.dart';
// import 'package:to_do/core/common_widget/primary_button.dart';
// import 'package:to_do/core/utils/show_snackbar.dart';
// import 'package:to_do/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:to_do/features/auth/presentation/widgets/auth_fields.dart';
// import 'package:to_do/features/auth/presentation/pages/sign_up_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthFailure) {
//             showSnackbar(context, state.message);
//           }
//         },
//         builder: (context, state) {
//           if (state is AuthLoading) {
//             return const Loader();
//           }
//           return Form(
//             key: formKey,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const CommonTextStyle(
//                         text: "Login",
//                         fontSize: 30,
//                         fontweight: FontWeight.bold,
//                       ),
//                       const SizedBox(height: 50),
//                       AuthField(hintText: "email", controller: emailController),
//                       const SizedBox(height: 15),
//                       AuthField(
//                         hintText: "Password",
//                         controller: passwordController,
//                       ),
//                       const SizedBox(height: 100),
//                       GestureDetector(
//                         onTap: () {
//                           if (formKey.currentState!.validate()) {
//                             context.read<AuthBloc>().add(
//                               AuthLogin(
//                                 email: emailController.text,
//                                 password: passwordController.text,
//                               ),
//                             );
//                           }
//                         },
//                         child: const PrimaryButton(
//                           showIcon: false,
//                           text: "Login",
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text("Don't have an account? "),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SignUpScreen(),
//                                 ),
//                               );
//                             },
//                             child: const Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

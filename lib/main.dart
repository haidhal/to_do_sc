import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:to_do/features/auth/domain/use_cases/current_user.dart';

import 'package:to_do/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:to_do/features/home/presentatiom/bloc/bloc/blog_bloc.dart';
import 'package:to_do/features/home/presentatiom/bloc/bloc/current_user_bloc.dart';
import 'package:to_do/features/home/presentatiom/pages/home_screen.dart';
import 'package:to_do/features/splash/presentation/pages/splash_screen.dart';
import 'package:to_do/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
         BlocProvider(create: (_) => serviceLocator<BlogBloc>()),
          BlocProvider(create: (_) => CurrentUserBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: AppTheme.darkTheme,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if(isLoggedIn){
            return HomeScreen();
          }
          return SplashScreen();
        },
      ),
    );
  }
}

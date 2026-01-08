import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:to_do/core/secrets/supabase_credentials.dart';
import 'package:to_do/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:to_do/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:to_do/features/auth/domain/repository/auth_repository.dart';
import 'package:to_do/features/auth/domain/use_cases/current_user.dart';
import 'package:to_do/features/auth/domain/use_cases/user_sign_up.dart';
import 'package:to_do/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:to_do/features/home/data/datasource/blog_remote_data_source.dart';
import 'package:to_do/features/home/data/repositories/blog_repository_impl.dart';
import 'package:to_do/features/home/domain/repositories/blog_repository.dart';
import 'package:to_do/features/home/domain/usecases/get_all_blogs.dart';
import 'package:to_do/features/home/domain/usecases/upload_blog.dart';
import 'package:to_do/features/home/presentatiom/bloc/bloc/blog_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBlog();
  final supabase = await Supabase.initialize(
    url: SupabaseSecrets.supabseUrl,
    anonKey: SupabaseSecrets.annonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  //DataSource
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceLocator()),
  );
  //repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );
  //use cases
  serviceLocator.registerFactory(
    () => UserSignUp(authRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(() => CurrentUser(serviceLocator()));
  //Bloc
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      currentUser: serviceLocator(),
      appuserCubit: serviceLocator(),
    ),
  );
}

void _initBlog() {
  //datasource
  serviceLocator
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(serviceLocator()),
    )
    //repository
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(serviceLocator()),
    )
    //usecase
    ..registerFactory(() => UploadBlog(serviceLocator()))
    ..registerFactory(() => GetAllBlogs(serviceLocator()))
    //bloc
    ..registerLazySingleton(
      () =>
          BlogBloc(uploadBlog: serviceLocator(), getAllBlogs: serviceLocator()),
    );
}

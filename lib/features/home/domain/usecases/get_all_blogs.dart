import 'package:fpdart/fpdart.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/home/domain/entities/blog.dart';
import 'package:to_do/features/home/domain/repositories/blog_repository.dart';

class GetAllBlogs implements Usecase<List<Blog>,NoParams>{
  final BlogRepository blogrepository;
  GetAllBlogs(this.blogrepository);
  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params)async {
    return await blogrepository.getAllBlogs();
  }
}
import 'package:fpdart/fpdart.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/features/home/domain/entities/blog.dart';

abstract interface class BlogRepository {
  Future<Either<Failure, Blog>> uploadBlog({
    required String title,
    required String content,
    required String posterId,
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<Either<Failure,List<Blog>>> getAllBlogs();
}

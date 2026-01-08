import 'package:fpdart/fpdart.dart';
import 'package:to_do/core/error/exception.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/features/home/data/datasource/blog_remote_data_source.dart';
import 'package:to_do/features/home/data/models/blod_model.dart';
import 'package:to_do/features/home/domain/entities/blog.dart';
import 'package:to_do/features/home/domain/repositories/blog_repository.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;
  BlogRepositoryImpl(this.blogRemoteDataSource);
  @override
  Future<Either<Failure, Blog>> uploadBlog({
    required String title,
    required String content,
    required String posterId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
   try {
      BlogModel blogModel = BlogModel(
      id: const Uuid().v1(),
      posterId: posterId,
      title: title,
      content: content,
      startDate: startDate,
      endDate: endDate,
    );
    final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);
    return right(uploadedBlog);
   } on ServerException catch (e) {
     return left(Failure(e.message));
   }
  }
}

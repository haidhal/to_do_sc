import 'package:fpdart/fpdart.dart';
import 'package:to_do/core/error/failure.dart';
import 'package:to_do/core/usecase/usecase.dart';
import 'package:to_do/features/home/domain/entities/blog.dart';
import 'package:to_do/features/home/domain/repositories/blog_repository.dart';

class UploadBlog implements Usecase<Blog, UploadBlogParams> {
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);
  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
    return await blogRepository.uploadBlog(
      title: params.title,
      content: params.content,
      posterId: params.posterId,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}

class UploadBlogParams {
  final String title;
  final String content;
  final String posterId;
  final DateTime startDate;
  final DateTime endDate;

  UploadBlogParams({
    required this.title,
    required this.content,
    required this.posterId,
    required this.startDate,
    required this.endDate,
  });
}

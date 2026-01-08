import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/features/home/domain/usecases/upload_blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog uploadBlog;
  BlogBloc(this.uploadBlog) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>((event, emit) async {
      final res = await uploadBlog(
        UploadBlogParams(
          title: event.title,
          content: event.content,
          posterId: event.posterId,
          startDate: event.startDate,
          endDate: event.endDate,
        ),
      );

      res.fold(
        (l) => emit(BlogFailure(l.message)), 
        (r) => emit(BlogSuccess()),);
    });
  }
}

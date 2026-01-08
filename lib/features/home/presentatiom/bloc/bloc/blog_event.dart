part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}
final class BlogUpload extends BlogEvent{
  final String title;
  final String content;
  final String posterId;
  final DateTime startDate;
  final DateTime endDate;

  BlogUpload({
    required this.title,
    required this.content,
    required this.posterId,
    required this.startDate,
    required this.endDate,
  });
}
final class BlogFetchAllBlogs extends BlogEvent{}

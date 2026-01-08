import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do/core/error/exception.dart';
import 'package:to_do/features/home/data/models/blod_model.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<List<BlogModel>> getAllblogs();
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourceImpl(this.supabaseClient);
// @override
// Future<BlogModel> uploadBlog(BlogModel blog) async {
//   try {
//     final userId = supabaseClient.auth.currentUser!.id;

//     final blogData = await supabaseClient
//         .from('blogs')
//         .insert({
//           ...blog.toJson(),
//           'poster_id': userId, // ✅ FORCE correct user
//         })
//         .select();

//     return BlogModel.fromJson(blogData.first);
//   } catch (e) {
//     throw ServerException(e.toString());
//   }
// }
// @override
// Future<List<BlogModel>> getAllblogs() async {
//   try {
//     final userId = supabaseClient.auth.currentUser!.id;

//     final blogs = await supabaseClient
//         .from('blogs')
//         .select('*, profiles(name)')
//         .eq('poster_id', userId); // ✅ FILTER

//     return blogs.map((blog) => BlogModel.fromJson(blog)).toList();
//   } catch (e) {
//     throw ServerException(e.toString());
//   }
// }

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final blogData = await supabaseClient
          .from('blogs')
          .insert(blog.toJson())
          .select();
          return BlogModel.fromJson(blogData.first);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  
  @override
  Future<List<BlogModel>> getAllblogs()async {
   try {
    final blogs = await supabaseClient.from('blogs').select('*,profiles(name)');
    return blogs.map((blog) =>BlogModel.fromJson(blog) ,).toList();
   } catch (e) {
     throw ServerException(e.toString());
   }
  }
}

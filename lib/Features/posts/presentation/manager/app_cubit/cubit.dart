import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/states.dart';
import 'package:posty/core/network/remote/dio_helper.dart';
import 'package:posty/core/network/remote/end_points.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostsInitialState());

  static PostsCubit get(BuildContext context)
  {
    return BlocProvider.of(context);
  }

  List<PostModel> posts = [];
  List<PostModel> searchPostsResult = [];

  void getPosts()
  {
    emit(GetPostsLoadingState());

    DioHelper.getData(url: POSTS).then((value)
    {
      posts = List.from(value.data).map((item)
      {
        return PostModel.fromJson(item);
      }).toList();
      searchPostsResult = posts;

      emit(GetPostsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPostsErrorState());
    });
  }


  PostModel? postDetails;

  void getPostDetails(String postId)
  {
    emit(GetPostDetailsLoadingState());

    DioHelper.getData(url: POST_DETAILS + postId).then((value)
    {
      postDetails = PostModel.fromJson(value.data);
      emit(GetPostDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPostDetailsErrorState());
    });
  }

  void createPost({
    required String title,
    required String body,
    int userId = 1,
  }) {
    emit(CreatePostLoadingState());

    DioHelper.postData(
      url: CREATE_POST,
      data: {
        'title': title,
        'body': body,
        'userId': userId,
      },
    ).then((value)

    {
      emit(CreatePostSuccessState());
      Future.delayed(const Duration(seconds: 2), () {getPosts();});

    }).catchError((error)
    {
      print(error.toString());
      emit(CreatePostErrorState());
    });
  }



  void searchPosts(String query)
  {
    searchPostsResult = posts.where((post)
    {
      return post.title!.toLowerCase().contains(query.toLowerCase()) || post.body!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(PostsSearchState());
  }

}

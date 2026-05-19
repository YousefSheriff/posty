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
  List<PostModel> postsResult = [];

  void getPosts()
  {
    emit(GetPostsLoadingState());

    DioHelper.getData(url: POSTS).then((value)
    {
      posts = List.from(value.data).map((item)
      {
        return PostModel.fromJson(item);
      }).toList();
      postsResult = posts;

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


  PostModel? createdPost;

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
      createdPost = PostModel.fromJson(value.data);
      print('Created Post ID: ${createdPost!.id}');
      emit(CreatePostSuccessState());
      getPosts();
    }).catchError((error)
    {
      print(error.toString());
      emit(CreatePostErrorState());
    });
  }


}

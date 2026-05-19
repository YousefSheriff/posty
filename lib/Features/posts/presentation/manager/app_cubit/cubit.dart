import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/posts/data/models/post_model.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/states.dart';
import 'package:posty/core/network/remote/dio_helper.dart';
import 'package:posty/core/network/remote/end_points.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostyInitialState());

  static PostsCubit get(BuildContext context)
  {
    return BlocProvider.of(context);
  }


  List<PostModel> posts = [];
  List<PostModel> postsResult = [];

  void getPosts() {
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

}

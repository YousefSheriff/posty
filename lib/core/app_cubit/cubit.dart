import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/app_cubit/states.dart';

class PostyCubit extends Cubit<PostyStates> {
  PostyCubit() : super(PostyInitialState());

  static PostyCubit get(BuildContext context)
  {
    return BlocProvider.of(context);
  }

  bool isFocused = false;

  void changeFocused(value)
  {
    isFocused = value;
    emit(PostyChangeFocusedState());
  }

}

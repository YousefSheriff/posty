import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/posts_body.dart';
import 'package:posty/core/network/network_cubit/cubit.dart';
import 'package:posty/core/network/network_cubit/states.dart';
import 'package:posty/core/shared/methods.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/utils/app_colors.dart';

class PostsScreen extends StatelessWidget
{
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityCubit, ConnectivityStates>(
      listener: (BuildContext context, ConnectivityStates networkState)
      {
        if (networkState is ConnectivityOfflineState)
        {
          final messenger = ScaffoldMessenger.of(context);
          messenger.hideCurrentSnackBar();
          messenger.showSnackBar(showSnackBar('No internet connection',AppColors.wifiError,true,true),);
        }
        else if (networkState is ConnectivityOnlineState)
        {
          final messenger = ScaffoldMessenger.of(context);
          messenger.hideCurrentSnackBar();
        }
      },
      builder: (BuildContext context, ConnectivityStates networkState)
      {
        final isOnline = networkState is! ConnectivityOfflineState;
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: customAppBar(context, 'Posts',true,isOnline),
          body: PostsListBody(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/posts_body.dart';
import 'package:posty/core/network/network_cubit/cubit.dart';
import 'package:posty/core/network/network_cubit/states.dart';
import 'package:posty/core/shared/methods.dart';
import 'package:posty/core/shared/shared_components.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_colors.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityCubit, ConnectivityStates>(
      listener: (context, networkState) {
        if (networkState is ConnectivityOfflineState) {
          final messenger = ScaffoldMessenger.of(context);
          messenger.hideCurrentSnackBar();
          messenger.showSnackBar(
            showSnackBar('No internet connection', AppColors.wifiError, true, true),
          );
        } else if (networkState is ConnectivityOnlineState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
      },
      builder: (context, networkState) {
        final isOnline = networkState is! ConnectivityOfflineState;

        return BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, themeState) {
            final themeCubit = ThemeCubit.get(context);
            final isDark = themeCubit.isDark;

            return Scaffold(
              backgroundColor: AppColors.backGround(isDark),
              appBar: customAppBar(context, 'Posts', true, isOnline, isDark),
              body: PostsListBody(isOnline: isOnline),

              floatingActionButton: FloatingActionButton(
                onPressed: ()
                {

                  themeCubit.toggleTheme();
                },
                backgroundColor: AppColors.appPrimaryColor,
                elevation: 6,
                tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                child: Icon(isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded, key: ValueKey(isDark), color: Colors.white, size: 26,),
              ),
            );
          },
        );
      },
    );
  }
}

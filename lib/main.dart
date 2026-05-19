import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posty/Features/posts/presentation/manager/app_cubit/cubit.dart';
import 'package:posty/core/network/network_cubit/cubit.dart';
import 'package:posty/core/network/remote/dio_helper.dart';
import 'package:posty/core/shared/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posty/core/theme/theme_cubit.dart';
import 'package:posty/core/theme/theme_states.dart';
import 'package:posty/core/utils/app_routes.dart';


void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
            create: (context)
            {
              return ConnectivityCubit();
            }),
        BlocProvider(
            create: (context)
            {
              return PostsCubit()..getPosts();
            }),
        BlocProvider(create: (context)
        {
          return ThemeCubit();
        }),


      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, themeState) {
          final themeCubit = ThemeCubit.get(context);
          return MaterialApp.router(
            title: 'P O S T Y',
            debugShowCheckedModeBanner: false,
            theme: themeCubit.lightTheme,
            darkTheme: themeCubit.darkTheme,
            themeMode: themeCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            routerConfig: AppRoutes.routers,
          );
        },
      ),
    );
  }
}
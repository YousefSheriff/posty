import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/posts_screen.dart';
import 'package:posty/core/network/network_cubit/cubit.dart';
import 'package:posty/core/shared/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
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

      ],
      child: MaterialApp(
        title: 'P O S T Y',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple),),
        home: PostsScreen(),
      ),
    );
  }
}
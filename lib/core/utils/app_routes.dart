import 'package:go_router/go_router.dart';
import 'package:posty/Features/auth/presentation/views/login/login_screen.dart';
import 'package:posty/Features/auth/presentation/views/main_auth/auth_screen.dart';
import 'package:posty/Features/auth/presentation/views/register/register_screen.dart';
import 'package:posty/Features/posts/presentation/views/create_post/create_post_screen.dart';
import 'package:posty/Features/posts/presentation/views/home_posts/posts_screen.dart';
import 'package:posty/Features/posts/presentation/views/post_details/post_details_screen.dart';
import 'package:posty/Features/splash/presentation/views/splash_screen.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const auth = '/auth';
  static const login = '/login';
  static const register = '/register';
  static const homePosts = '/homePosts';
  static const postDetail = '/postDetail';
  static const createPost = '/createPost';

  static final routers = GoRouter(
      routes:
      [
        GoRoute(
          path: splash,
          builder:(context , state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: auth,
          builder:(context , state)=> const AuthScreen(),
        ),
        GoRoute(
          path: login,
          builder:(context , state)=> const LoginScreen(),
        ),
        GoRoute(
          path: register,
          builder:(context , state)=> const RegisterScreen(),
        ),
        GoRoute(
          path: homePosts,
          builder:(context , state)=> const PostsScreen(),
        ),
        GoRoute(
          path: postDetail,
          builder: (context, state) => PostDetailsScreen(
            postId: state.extra.toString(),
          ),
        ),
        GoRoute(
          path: createPost,
          builder: (context, state) => CreatePostScreen(),
        ),
      ]
  );

}

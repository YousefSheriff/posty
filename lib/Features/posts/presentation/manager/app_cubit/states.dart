
abstract class PostsStates {}

class PostyInitialState extends PostsStates{}

class GetPostsLoadingState extends PostsStates {}

class GetPostsSuccessState extends PostsStates {}

class GetPostsErrorState extends PostsStates {}


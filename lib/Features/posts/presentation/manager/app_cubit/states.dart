
abstract class PostsStates {}

class PostyInitialState extends PostsStates{}

class GetPostsLoadingState extends PostsStates {}

class GetPostsSuccessState extends PostsStates {}

class GetPostsErrorState extends PostsStates {}

class GetPostDetailsLoadingState extends PostsStates {}

class GetPostDetailsSuccessState extends PostsStates {}

class GetPostDetailsErrorState extends PostsStates {}

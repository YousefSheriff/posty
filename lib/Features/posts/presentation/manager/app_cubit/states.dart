
abstract class PostsStates {}

class PostsInitialState extends PostsStates{}

class GetPostsLoadingState extends PostsStates {}

class GetPostsSuccessState extends PostsStates {}

class GetPostsErrorState extends PostsStates {}

class GetPostDetailsLoadingState extends PostsStates {}

class GetPostDetailsSuccessState extends PostsStates {}

class GetPostDetailsErrorState extends PostsStates {}

class CreatePostLoadingState extends PostsStates {}

class CreatePostSuccessState extends PostsStates {}

class CreatePostErrorState extends PostsStates {}

class PostsSearchState extends PostsStates {}

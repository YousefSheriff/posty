class PostModel {
  final int?    id;
  final int?    userId;
  final String? title;
  final String? body;

  PostModel({this.id, this.userId, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json)
      : id     = json['id'],
        userId = json['userId'],
        title  = json['title'],
        body   = json['body'];

  Map<String, dynamic> toMap() => {
        'id':     id,
        'userId': userId,
        'title':  title,
        'body':   body,
      };
}

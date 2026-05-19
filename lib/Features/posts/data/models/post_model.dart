class PostModel {
  final String? id;
  final int?    userId;
  final String? title;
  final String? body;
  final String? dateTime;

  PostModel({this.id, this.userId, this.title, this.body, this.dateTime});

  PostModel.fromJson(Map<String, dynamic> json)
      : id        = json['id'],
        userId    = json['userId'],
        title     = json['title'],
        body      = json['body'],
        dateTime = json['dateTime'];


  Map<String, dynamic> toMap()
  {
    return {
    'id':        id,
    'userId':    userId,
    'title':     title,
    'body':      body,
    'dateTime': dateTime,
  };
  }
}
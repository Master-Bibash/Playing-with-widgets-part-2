class Post {
  final String title;
  final String body;
  final int id;
//to object converdion from map
  Post.fromJson(Map<String,dynamic> json)
      : title = json['title'],
        body = json['body'],
        id = json['id'];
}

class Post {
  final String title;
  final String body;
  final int id;
<<<<<<< HEAD

  Post.fromJson(Map json)
=======
//to object converdion from map
  Post.fromJson(Map<String,dynamic> json)
>>>>>>> 6948d9de43a31843e7e1c0901d0a73e6dcb136dd
      : title = json['title'],
        body = json['body'],
        id = json['id'];
}

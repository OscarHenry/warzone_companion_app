import 'user.dart';

class Post {
  final String title;
  final int views;
  final String image;
  final User user;

  const Post({
    required this.title,
    this.views = 0,
    this.image = 'https://picsum.photos/200',
    required this.user,
  });
}

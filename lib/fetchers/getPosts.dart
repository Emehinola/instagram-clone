import 'package:instagram/models/posts_model.dart';

// code for getting all the posts by friends

List<Post> getPosts() {
  List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/vic.jpg',
  ];

  List<String> names = [
    'Sam',
    'Johnson',
    'Nanaopri',
    'Adeolu_michael',
    'Yusuf',
    'Chinedu'
  ];
  String write_up =
      'Once upon a time, there lived a Man named JULIUS. Yea, he was my father. \nA great and loyal man. I really miss him';
  Post post;
  List<Post> _listOfPosts = [];

  for (int index = 0; index < names.length; index++) {
    post = Post(
        friend: '${names[index]}',
        img: '${images[index]}',
        likes: index,
        write_up: write_up);

    _listOfPosts.add(post);
  }
  return _listOfPosts;
}

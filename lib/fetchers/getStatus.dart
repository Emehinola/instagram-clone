import 'package:instagram/models/status.dart';

// getting the status here
List<Status> getUserStatus() {
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
  Status user;
  List<Status> status = [];

  for (int index = 0; index < images.length; index++) {
    user = Status(img: images[index], name: names[index]);
    status.add(user);
  }
  return status;
}

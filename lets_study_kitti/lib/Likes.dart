import 'package:flutter/material.dart';

const double IMG_SIZE = 50;

class Likes extends StatelessWidget{

  int like_count = 0;

  Likes(int like_count) {
    this.like_count = like_count;
  }

  Widget build(BuildContext context) {
    return Row(children: [
      Text(like_count.toString(), style: TextStyle(fontSize: 10)),
      SizedBox(width: 5),
      Image.asset('images/heart.png', height: IMG_SIZE/2, width: IMG_SIZE/2)
    ]);
  }  
}
import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Rating.dart' show Rating;
import 'package:lets_study_kitti/Likes.dart' show Likes;

class Review extends StatelessWidget {
  Rating ratings = new Rating(-1, -1, -1);
  Text reviewTxt = new Text('');
  String lecturer = '';
  Likes likes = Likes(0);
  String recommend = '';
  String sem = '';
  String year = '';

  Review.def() {}

  Review(int difficulty, int interest, int teaching, String reviewTxt, String lecturer, int likeCount, String recommend, String year, String sem) {
    this.likes = Likes(likeCount);
    this.ratings = new Rating(difficulty, interest, teaching);
    this.reviewTxt = new Text(reviewTxt, style: TextStyle(fontSize: 12));
    this.lecturer = lecturer;
    this.recommend = recommend;
    this.sem = sem;
    this.year = year;
  }

  Widget build(BuildContext context) { 
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ratings,
            likes,
            ]
        ),
        SizedBox(height: 10),
        Text('Lecturer: '+ lecturer, style: TextStyle(fontSize: 13)),
        SizedBox(height: 10),
        Text('Recommend: '+ recommend, style: TextStyle(fontSize: 13)),
        SizedBox(height: 10),
        Text('When Taken: '+ year + ' ' + sem, style: TextStyle(fontSize: 13)),
        SizedBox(height: 10),
        reviewTxt,
      ]
      );
  }

}
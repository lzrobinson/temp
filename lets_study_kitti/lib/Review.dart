import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Rating.dart' show Rating;

class Review extends StatelessWidget {
  Rating ratings = new Rating(-1, -1, -1);
  Text reviewTxt = new Text('');

  Review(int difficulty, int interest, int teaching, Text reviewTxt) {
    this.ratings = new Rating(difficulty, interest, teaching);
    this.reviewTxt = reviewTxt;
  }

    Widget build(BuildContext context) { 
    return ListView(
      shrinkWrap: true,
      children: [
        ratings,
        reviewTxt,
      ]
      );
  }

}
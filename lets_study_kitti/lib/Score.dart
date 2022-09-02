import 'package:flutter/material.dart';
import 'package:lets_study_kitti/StarDisplay.dart' show StarDisplayWidget;

final double IMG_SIZE = 15;

class Score extends StatelessWidget {
  
  int score = 0;
  var stars = null;

  Score(int score) {
    this.score = score;
    this.stars = new StarDisplayWidget(value: score,
    filledStar: Container(
      margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
      child: Image.asset('assets/images/fpaw.png', height:IMG_SIZE, width:IMG_SIZE)),
    unfilledStar: Container(
      margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
      child: Image.asset('assets/images/paw.png', height:IMG_SIZE, width:IMG_SIZE)
    ));
  }

  Widget build(BuildContext context) {
    return Row(
    mainAxisSize: MainAxisSize.min,
    children:
      [stars]
    ,);
  }

  void setScore(int score) {
    this.score = score;
  }
}

import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Score.dart' show Score;

class Rating extends StatelessWidget {
  Score difficulty = new Score(-1);
  Score interest = new Score(-1);
  Score teaching = new Score(-1);

  Rating(int difficulty, int interest, int teaching) {
    this.difficulty = new Score(difficulty);
    this.interest = new Score(interest);
    this.teaching = new Score(teaching);
  }

  Widget build(BuildContext context) { 

    return Row(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Text("Difficulty", style: TextStyle(fontSize: 15)),
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Text("Interest Level", style: TextStyle(fontSize: 15)),
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Text("Teaching Quality", style: TextStyle(fontSize: 15)),
            )
          )
        ]),
      SizedBox(width: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          difficulty,
          interest,
          teaching,
      ])
    ]);
  }
}
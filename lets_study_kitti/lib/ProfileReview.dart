import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Review.dart' show Review;

const double IMG_SIZE = 50;

class ProfileReview extends StatelessWidget {

  Review review = new Review.def();
  Text username = new Text('');
  Text major = new Text('');
  CircleAvatar profile_pic = CircleAvatar(
    radius: IMG_SIZE/2,
    backgroundImage: NetworkImage('assets/images/user.png'),
  );

  ProfileReview.noPic(int difficulty, int interest, int teaching, String reviewTxt, String username, String major) {
    this.review = new Review(difficulty, interest, teaching, reviewTxt);
    this.username = new Text(username,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
    this.major = new Text(major, style: TextStyle(fontSize: 9));
  }

  ProfileReview(int difficulty, int interest, int teaching, String reviewTxt, String username, String profile_pic, String major) {
    this.review = new Review(difficulty, interest, teaching, reviewTxt);
    this.username = new Text(username,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
    this.profile_pic = CircleAvatar(
      radius: IMG_SIZE/2,
      backgroundImage: NetworkImage(profile_pic),
    );
    this.major = new Text(major, style: TextStyle(fontSize: 9));
  }

  
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(children: [
          profile_pic,
          SizedBox(width: 10),
          username,
          SizedBox(width: 5),
          major,
        ]),
        SizedBox(height: 20),
        review,
      ]
    );
  }


}

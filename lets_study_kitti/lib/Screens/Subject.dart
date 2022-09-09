import 'package:flutter/material.dart';
import 'package:lets_study_kitti/ProfileReview.dart' show ProfileReview;

const BOUNDARY_SIZE = 100.0;

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  State<Subject> createState() {
    return _SubjectState();
  }
}

class _SubjectState extends State<Subject> {
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.fromLTRB(BOUNDARY_SIZE, 25, 0, 25),
            child: Text(
              "Add a Review",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
            ),
          ),
        ),
      ]
    );
  }

  // Set up all these methods using database 

  // Given subject code get subject name

  String getSubjectName(String subjectCode) {
    String subjectName = '';
    return subjectName;
  }

  // Get all reviews for the specified subject code

  List<ProfileReview> getSubjectReviews(String subjectCode) {
    List<ProfileReview> reviews = [];

    return reviews;
  }

}






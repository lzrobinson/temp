import 'package:flutter/material.dart';
import 'package:lets_study_kitti/ProfileReview.dart' show ProfileReview;
const BOUNDARY_SIZE = 100.0;

class SubjectPage extends StatelessWidget {

  String subjectCode = '';

  SubjectPage(this.subjectCode);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.fromLTRB(BOUNDARY_SIZE, 25, 0, 25),
              child: Text(
                getSubjectName(subjectCode) + ' - ' + subjectCode,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
              ),
            ),
          ),
        ]
      )
    );
  }

  // Set up all these methods using database 

  // Given subject code get subject name

  String getSubjectName(String subjectCode) {
    String subjectName = 'IT Project';
    return subjectName;
  }

  // Get all reviews for the specified subject code

  List<ProfileReview> getSubjectReviews(String subjectCode) {
    List<ProfileReview> reviews = [];

    return reviews;
  }

}
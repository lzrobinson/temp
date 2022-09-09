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
          Container(
            padding: EdgeInsets.only(left: BOUNDARY_SIZE, right: BOUNDARY_SIZE),
            child: Card(
            child: ListView(children: getSubjectReviews(subjectCode), shrinkWrap: true)
            )
          )
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

    // Below code is just for front end testing

    var review1 = new ProfileReview.noPic(2, 3, 4, 'Boring and hard', 'Vinay', '(Major of Computing)', 'Paul Jones', 10, 'yes', '2021', 'Semester 1');
    var review2 = new ProfileReview.noPic(5, 8, 9, 'Fantastic subject', 'Abrar', '(Major of Engineering)', 'Mr Man', 5, 'no', '2020', 'Semester 1');
    var review3 = new ProfileReview(4, 10, 8, 'Ehhhhh', 'Sen','assets/images/sen-turner.png', '(Major of Data Science)', 'Sen', 3, 'no', '2019', 'Semester 2');
    
    reviews.add(review1);
    reviews.add(review2);
    reviews.add(review3);
    
    return reviews;
  }

}
import 'package:flutter/material.dart';
import 'package:lets_study_kitti/ProfileReview.dart' show ProfileReview;
const BOUNDARY_SIZE = 100.0;
const H_OFFSET = 30.0;
const V_OFFSET = 15.0;
const double IMG_SIZE = 100;

class SubjectPage extends StatelessWidget {

  String subjectCode = '';
  List<ProfileReview> reviews = [];

  SubjectPage(subjectCode) {
    this.subjectCode = subjectCode;
    this.reviews = getSubjectReviews(subjectCode);
  }

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
              padding: const EdgeInsets.fromLTRB(BOUNDARY_SIZE+2*H_OFFSET, 25, 0, 25),
              child: Text(
                '${getSubjectName(subjectCode)} - $subjectCode',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.fromLTRB(BOUNDARY_SIZE+2*H_OFFSET, 0, 0, 0),
              child: Row(
                children: [
                  Image.asset(getRecommendationImage(reviews), height: IMG_SIZE/2, width: IMG_SIZE/2),
                  SizedBox(width: 10),
                  Text(
                    "${(recommendedRate(reviews) * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(fontSize: 30)
                  ),
                  const Text(
                    '  Recommended',
                    style: TextStyle(fontSize: 12)
                  )
                ]
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: BOUNDARY_SIZE+H_OFFSET, right: BOUNDARY_SIZE+H_OFFSET),
            child: const Divider(color: Colors.black, height: 30),
          ),
          Container(
            padding: const EdgeInsets.only(left: BOUNDARY_SIZE, right: BOUNDARY_SIZE),
            child: Card(
              child: Container(
                padding: const EdgeInsets.only(left: H_OFFSET, right: H_OFFSET, top: V_OFFSET, bottom: V_OFFSET),
                child: Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          width: 50, 
                          height: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.orange
                            ),
                          ),
                        ),
                        const Text('  Subject Information  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                      ],
                    )
                  ],
                )
              )
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: BOUNDARY_SIZE+H_OFFSET, right: BOUNDARY_SIZE+H_OFFSET),
            child: const Divider(color: Colors.black, height: 30),
          ),
          Container(
            padding: const EdgeInsets.only(left: BOUNDARY_SIZE, right: BOUNDARY_SIZE),
            child: Card(
              child: Container(
                padding: const EdgeInsets.only(left: H_OFFSET, right: H_OFFSET, top: V_OFFSET, bottom: V_OFFSET),
                child: ListView(
                  shrinkWrap: true,
                  children: reviews
                  )
              )
            )
          )
        ]
      )
    );
  }

  double recommendedRate(List<ProfileReview> reviews) {
    int yesCount = 0;
    int noCount = 0;

    for (ProfileReview review in reviews) {
      if (review.getReview().getRecommended() == 'Yes') {
        yesCount++;
      }
      else {
        noCount++;
      }
    }
    
    return yesCount/(yesCount+noCount);
  }

  String getRecommendationImage(List<ProfileReview> reviews) {
    double rate = recommendedRate(reviews);

    if (rate < 0.33) {
      return 'images/frown.png';
    }
    else if (rate < 0.66) {
      return 'images/flat.png';
    }
    else {
      return 'images/smile.png';
    }

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

    var review1 = new ProfileReview.noPic(2, 3, 4, 'Boring and hard', 'Vinay', '(Major of Computing)', 'Paul Jones', 10, 'Yes', '2021', 'Semester 1');
    var review2 = new ProfileReview.noPic(5, 8, 9, 'Fantastic subject', 'Abrar', '(Major of Engineering)', 'Mr Man', 5, 'No', '2020', 'Semester 1');
    var review3 = new ProfileReview(4, 10, 8, 'Ehhhhh', 'Sen','assets/images/sen-turner.png', '(Major of Data Science)', 'Sen', 3, 'No', '2019', 'Semester 2');
    
    reviews.add(review1);
    reviews.add(review2);
    reviews.add(review3);
    
    return reviews;
  }

}
import 'package:flutter/material.dart';
import 'package:lets_study_kitti/home_page/my_navigation_bar.dart';
import 'package:lets_study_kitti/likes.dart' show Likes;
import 'package:lets_study_kitti/profile_review.dart' show ProfileReview;
import 'package:lets_study_kitti/rating.dart' show Rating;
import 'package:lets_study_kitti/score.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lets_study_kitti/review.dart' show Review;
import 'package:cloud_firestore/cloud_firestore.dart';

const boundarySize = 100.0;
const hOffset = 30.0;
const vOffset = 15.0;
const double imgSize = 100;

class SubjectPage extends StatefulWidget {
  final String subjectCode;

  const SubjectPage({Key? key, required this.subjectCode}) : super(key: key);

  @override
  State<SubjectPage> createState() {
    return _SubjectPageState();
  }
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    List<ProfileReview> reviews = getSubjectReviews(widget.subjectCode);
    return Scaffold(
        appBar: const MyNavigationBar(),
        body: ListView(shrinkWrap: true, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  boundarySize + 2 * hOffset, 25, 0, 25),
              child: Text(
                  '${getSubjectName(widget.subjectCode)} - ${widget.subjectCode}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  boundarySize + 2 * hOffset, 0, 0, 0),
              child: Row(children: [
                Image.asset(getRecommendationImage(reviews),
                    height: imgSize / 2, width: imgSize / 2),
                const SizedBox(width: 10),
                Text("${(recommendedRate(reviews) * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(fontSize: 30)),
                const Text('  Recommended', style: TextStyle(fontSize: 12))
              ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: boundarySize + hOffset, right: boundarySize + hOffset),
            child: const Divider(color: Colors.black, height: 30),
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: boundarySize, right: boundarySize),
              child: Card(
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: hOffset,
                          right: hOffset,
                          top: vOffset,
                          bottom: vOffset),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: Colors.orange),
                                ),
                              ),
                              Text('  Subject Information  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              SizedBox(
                                width: 690,
                                height: 30,
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: Colors.orange),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding:
                                const EdgeInsets.fromLTRB(0, vOffset, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                child: const Text('Handbook Link'),
                                onTap: () => launchUrl(Uri.parse(
                                    getHandbookLink(widget.subjectCode)))),
                          )
                        ],
                      )))),
          Container(
            padding: const EdgeInsets.only(
                left: boundarySize + hOffset, right: boundarySize + hOffset),
            child: const Divider(color: Colors.black, height: 30),
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: boundarySize, right: boundarySize),
              child: Card(
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: hOffset,
                          right: hOffset,
                          top: vOffset,
                          bottom: vOffset),
                      child: Column(children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 50,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.orange),
                              ),
                            ),
                            Text('  Reviews  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(
                              width: 780,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: vOffset),
                        ListView(shrinkWrap: true, children: reviews)
                      ]))))
        ]));
  }

  double recommendedRate(List<ProfileReview> reviews) {
    int yesCount = 0;
    int noCount = 0;

    for (ProfileReview review in reviews) {
      if (review.getReview().getRecommended() == 'Yes') {
        yesCount++;
      } else {
        noCount++;
      }
    }

    return yesCount / (yesCount + noCount);
  }

  String getRecommendationImage(List<ProfileReview> reviews) {
    double rate = recommendedRate(reviews);

    if (rate < 0.33) {
      return 'images/frown.png';
    } else if (rate < 0.66) {
      return 'images/flat.png';
    } else {
      return 'images/smile.png';
    }
  }

  // Set up all these methods using database

  // Given subject code get subject name

  String getSubjectName(String subjectCode) {
    FirebaseFirestore.instance
        .collection('subjects')
        .where('subjectCode', isEqualTo: subjectCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        return doc['subjectName'];
      });
    });

    return '';
  }

  // Get all reviews for the specified subject code

  List<ProfileReview> getSubjectReviews(String subjectCode) {
    List<ProfileReview> reviews = [];

    FirebaseFirestore.instance
        .collection('reviews')
        .where('subjectCode', isEqualTo: subjectCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var review = ProfileReview(
            review: Review(
                ratings: Rating(
                    difficulty: Score(score: doc['difficulty']),
                    interest: Score(score: doc['interesting']),
                    teaching: Score(score: doc['teachingQuality'])),
                reviewTxt: doc['reviewText'],
                lecturer: doc['lecturer'],
                likes: Likes(likeCount: 0),
                recommend: doc['recommended'],
                year: doc['year'],
                sem: doc['semesterTaken'],
                stream: doc['subjectType']),
            username: getUsername(doc['userID']),
            major: getMajors(doc['userID']));

        reviews.add(review);
      });
    });

    return reviews;
  }

  // Get the handbook link given the subject code

  String getHandbookLink(String subjectCode) {
    FirebaseFirestore.instance
        .collection('subjects')
        .where('subjectCode', isEqualTo: subjectCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        return doc['link'];
      });
    });

    return '';
  }

  String getUsername(String userID) {
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        return doc['name'];
      });
    });

    return '';
  }

  String getMajors(String userID) {
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: userID)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        return doc['major'];
      });
    });

    return '';
  }
}

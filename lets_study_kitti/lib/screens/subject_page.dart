import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Likes.dart';
import 'package:lets_study_kitti/profile_review.dart' show ProfileReview;
import 'package:lets_study_kitti/Rating.dart';
import 'package:lets_study_kitti/Score.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lets_study_kitti/Review.dart' show Review;
import 'package:cloud_firestore/cloud_firestore.dart';

const boundarySize = 100.0;
const hOffset = 30.0;
const vOffset = 15.0;
const double imgSize = 100;

class SubjectPage extends StatefulWidget {
  final String subjectCode;

  const SubjectPage({Key? key, required this.subjectCode}) : super(key: key);

  @override
  _SubjectPageState createState() {
    return _SubjectPageState();
  }
}

class _SubjectPageState extends State<SubjectPage> {
  final _firestore = FirebaseFirestore.instance;
  Map<String, List<String>> _userDetails = {};
  var reviews = [];
  var reviewLen = 0;
  var recommendNum = 0;
  var handbookLink = '';
  var subjectName = '';
  var name = '';
  var majors = '';

  @override
  void initState() {
    super.initState();
    getSubjectName(widget.subjectCode);
    getRecommended(widget.subjectCode);
    getHandbookLink(widget.subjectCode);
    addUserDetails();
  }

  // Given subject code get subject name
  void getSubjectName(String subjectCode) {
    _firestore
        .collection('subjects')
        .where('subjectCode', isEqualTo: subjectCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          subjectName = doc['subjectName'];
        });
      });
    });
  }

// Get the handbook link given the subject code
  void getHandbookLink(String subjectCode) {
    _firestore
        .collection('subjects')
        .where('subjectCode', isEqualTo: subjectCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          handbookLink = doc['link'];
        });
      });
    });
  }

  void getRecommended(String subjectCode) {
    _firestore
        .collection('reviews')
        .where('subjectCode', isEqualTo: subjectCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          if (doc['recommended'] == 'Yes') {
            recommendNum += 1;
          }
          reviewLen += 1;
        });
      });
    });
  }

  // Get the majors and  given the userID
  void addUserDetails() {
    _firestore.collection('users').get().then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          name = doc['name'];
          majors = doc['major'];
          _userDetails[doc['uid']] = [name, majors];
        });
      });
    });
  }

  // Get all reviews for the specified subject code
  void getSubjectReviews(String subjectCode) {
    _firestore
        .collection('reviews')
        .where('subjectCode', isEqualTo: subjectCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          //getUserDetails(doc['uid']);
          reviews.add(ProfileReview(
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
                  sem: doc['semesterTaken']),
              username: name,
              major: majors));
        });
      });
    });
  }

  @override
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
        body: ListView(shrinkWrap: true, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  boundarySize + 2 * hOffset, 25, 0, 25),
              child: Text('${subjectName} - ${widget.subjectCode}',
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
                Image.asset(getRecommendationImage(recommendNum / reviewLen),
                    height: imgSize / 2, width: imgSize / 2),
                const SizedBox(width: 10),
                Text("${(recommendNum / reviewLen * 100).toStringAsFixed(1)}%",
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
                                onTap: () =>
                                    launchUrl(Uri.parse(handbookLink))),
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
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('reviews')
                                .where('subjectCode',
                                    isEqualTo: widget.subjectCode)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map((document) {
                                  //var text = document['reviewTxt'];
/*
                                YoutubePlayerController _controller = YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(url),
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                    disableDragSeek: false,
                                    loop: false,
                                    isLive: false,
                                    forceHD: false,
                                  ),
                                );*/
                                  return Container(
                                          child: ProfileReview(
                                              major: _userDetails[
                                                  document['userID']]![1],
                                              username: _userDetails[
                                                  document['userID']]![0],
                                              review: Review(
                                                  ratings: Rating(
                                                      difficulty: Score(
                                                          score: int.parse(
                                                              document[
                                                                  'difficulty'])),
                                                      interest: Score(
                                                          score:
                                                              int.parse(document['interesting'])),
                                                      teaching: Score(score: int.parse(document['teachingQuality']))),
                                                  reviewTxt: document['reviewText'],
                                                  lecturer: document['lecturer'],
                                                  likes: Likes(likeCount: 0),
                                                  recommend: document['recommended'],
                                                  year: document['year'],
                                                  sem: document['semesterTaken'])))

                                      /* return Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 20,
                                              bottom: 5,
                                            ),
                                            child: Text(
                                              document['reviewText'],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )*/
                                      ;
                                }).toList(),
                              );
                            }),
                      ]))))
        ]));
  }

  double recommendedRate(List<dynamic> reviews) {
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

  String getRecommendationImage(double rate) {
    if (rate < 0.33) {
      return 'images/frown.png';
    } else if (rate < 0.66) {
      return 'images/flat.png';
    } else {
      return 'images/smile.png';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:review_threads/heading_bar.dart';
import 'package:review_threads/profile_bar.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 5,
              blurRadius: 7,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          HeadingBar('Review'),
          ProfileBar('Sen', 'Major of Data Science'),
        ],
      ),
    );
  }
}

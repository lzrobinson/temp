import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Screens/Subject.dart' show Subject;

class SubjectPage extends StatelessWidget {

  String subjectCode = '';

  SubjectPage(this.subjectCode);

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
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
      body: Subject()
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Rating.dart' show Rating;


void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
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
          reviews,
          const Text("What a good review"),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

var review1 = new Rating(2, 3, 4);
var review2 = new Rating(5, 8, 9);
var review3 = new Rating(4, 10, 8);


var reviews = ListView(children: [
  review1,
  review2,
  review3,
], shrinkWrap: true);

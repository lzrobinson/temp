import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Review.dart' show Review;


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
      body: Center(child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 100,
        child: Card(
          elevation: 20,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            children: [
            reviews,
            ]
          ),
        )
      )),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

var review1 = new Review(2, 3, 4, new Text('Boring and hard'));
var review2 = new Review(5, 8, 9, new Text('Fantastic subject'));
var review3 = new Review(4, 10, 8, new Text('Ehhhhh'));


var reviews = ListView(children: [
  review1,
  review2,
  review3,
], shrinkWrap: true);

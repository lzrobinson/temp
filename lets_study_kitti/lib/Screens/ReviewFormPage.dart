import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Screens/ReviewForm.dart' show ReviewForm;

class ReviewFormPage extends StatelessWidget {
  const ReviewFormPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      backgroundColor: Colors.transparent,
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
      body: const ReviewForm()
    );
  }
}
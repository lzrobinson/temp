import 'package:flutter/material.dart';
import 'package:lets_study_kitti/Screens/ReviewFormPage.dart' show ReviewFormPage;
import 'package:lets_study_kitti/Screens/SubjectPage.dart' show SubjectPage;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizations.delegate.supportedLocales,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SubjectPage('30023')),
    );
  }
}

/*

var review1 = new ProfileReview.noPic(2, 3, 4, 'Boring and hard', 'Vinay', '(Major of Computing)', 'Paul Jones', 10);
var review2 = new ProfileReview.noPic(5, 8, 9, 'Fantastic subject', 'Abrar', '(Major of Engineering)', 'Mr Man', 5);
var review3 = new ProfileReview(4, 10, 8, 'Ehhhhh', 'Sen','assets/images/sen-turner.png', '(Major of Data Science)', 'Sen', 3);

var form = new ReviewForm();

var reviews = ListView(children: [
  review1,
  Divider(color: Colors.black, height: 30),
  review2,
  Divider(color: Colors.black, height: 30),
  review3,
], shrinkWrap: true);
*/
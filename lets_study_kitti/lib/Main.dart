import 'package:flutter/material.dart';
import 'package:lets_study_kitti/routes.dart';
import 'package:lets_study_kitti/screens/login_page.dart';
import 'package:lets_study_kitti/screens/review_form_page.dart'
    show ReviewFormPage;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lets_study_kitti/screens/review_form_page.dart';
import 'package:lets_study_kitti/screens/sign_up_page.dart';
import 'package:lets_study_kitti/screens/subject_page.dart' show SubjectPage;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Routes.loginPage,
        routes: {
          Routes.loginPage: (BuildContext context) => const LoginPage(),
          Routes.reviewFormPage: (BuildContext context) =>
              const ReviewFormPage(),
          Routes.signUpPage: (BuildContext context) => const SignUpPage(),
          Routes.subjectPage: (BuildContext context) =>
              const SubjectPage(subjectCode: '30023'),
        },
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
          child: loginPage,
        ));
  }
}

ReviewFormPage reviewFormPage = const ReviewFormPage();
SubjectPage subjectPage = const SubjectPage(subjectCode: '30023');
LoginPage loginPage = const LoginPage();
SignUpPage signUpPage = const SignUpPage();

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
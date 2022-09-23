import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_study_kitti/routes.dart';
import 'package:lets_study_kitti/screens/subject_page.dart';

const boxColor = Color.fromARGB(255, 254, 244, 225);

class MyNavigationBar extends StatelessWidget with PreferredSizeWidget {
  const MyNavigationBar({super.key});

  static const Map<String, String> _subjectCodes = <String, String>{
    'IT Project': 'COMP30023',
    'Foundations of Computing': 'COMP10001',
    'Algorithms and Data Structures': 'COMP20008',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          MaterialButton(
              height: 30,
              child:
                  Image.asset('assets/images/home.png', height: 30, width: 30),
              onPressed: () => Navigator.pushNamed(context, Routes.homePage)),
          SizedBox(
            width: MediaQuery.of(context).size.width - 320,
            child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _subjectCodes.keys.where((String option) {
                    return option.contains(textEditingValue.text.toUpperCase());
                  });
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) {
                  return TextField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search',
                          focusedBorder: OutlineInputBorder()));
                },
                onSelected: (String value) => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            SubjectPage(subjectCode: _subjectCodes[value]!)))),
          ),
          MaterialButton(
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/user.png', height: 20, width: 20),
                const Text(' Login/Sign Up'),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.loginPage);
            },
          ),
          const SizedBox(width: 5.0),
          MaterialButton(
              child: Row(
                children: <Widget>[
                  Image.asset('assets/images/enter.png', height: 20, width: 20),
                  const Text(' Sign Out'),
                ],
              ),
              onPressed: () => FirebaseAuth.instance.signOut())
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

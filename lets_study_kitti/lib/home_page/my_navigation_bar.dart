import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_study_kitti/routes.dart';

class MyNavigationBar extends StatelessWidget with PreferredSizeWidget {
  const MyNavigationBar({super.key});

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
          ),
          // TextField(
          //     decoration: InputDecoration(
          //   border: OutlineInputBorder(),
          //   hintText: 'Search',
          // )),
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

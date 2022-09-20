import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( color: Colors.orange,
      padding: EdgeInsets.all(5),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row( 
        children: <Widget>[
          SizedBox(
            child: Image.asset('assets/icons/home.png'),
          ),
          SizedBox(width: MediaQuery.of(context).size.width - 250,),
          // TextField(
          //     decoration: InputDecoration(
          //   border: OutlineInputBorder(),
          //   hintText: 'Search',
          // )),
          SizedBox(
            child: Row(children: <Widget>[
              Image.asset('assets/icons/login.png'),
              const Text('Login'),
            ],)
          ),
          SizedBox(
            child: Row(children: <Widget>[
              Image.asset('assets/icons/adduser.png'),
              const Text('Sign up'),
            ],)
          )
        ],
      ),
    );
  }
}

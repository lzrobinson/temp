import 'package:flutter/material.dart';

class WebsiteTitle extends StatelessWidget {
  const WebsiteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 130,
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   border: Border.all(),
      // color: Colors.black

      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/cat.png'),
            SizedBox(
              width: 15,
            ),
            const Text(
              'Let\'s Study Kitti',
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 15,
            ),
            Image.asset('assets/icons/cat.png'),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Center(
            child: Text(
          'Unimelb\'s Leading Subject Review Website',
          style: TextStyle(fontSize: 30),
        ))
      ]),
    );
  }
}

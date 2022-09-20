import 'package:flutter/material.dart';

class HomeContents extends StatelessWidget {
  const HomeContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 5,
                blurRadius: 7,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _ContentIcon('assets/icons/scholar.png', 'Recommended Subjects',
                Colors.deepOrange),
            const SizedBox(
              width: 30,
            ),
            const _ContentIcon(
                'assets/icons/trending.png', 'Trending Reviews', Colors.lime),
            const SizedBox(
              width: 30,
            ),
            _ContentIcon(
                'assets/icons/user.png', 'Profile', Colors.purple.shade100),
          ],
        ));
  }
}

class _ContentIcon extends StatelessWidget {
  const _ContentIcon(this.image, this.text, this.color);
  final String image;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(color: color),
      child: Center(
        child: Column(
          children: [
            Image.asset(image),
            const SizedBox(
              height: 10,
            ),
            Text(text, style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}

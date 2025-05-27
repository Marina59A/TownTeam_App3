import 'package:flutter/material.dart';

class MensCatogry extends StatelessWidget {
  const MensCatogry({super.key});
static String id = 'mens_catogry';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/jacket.jpg'),
            Image.asset('assets/images/sweatshirt.jpg'),
            Image.asset('assets/images/pullover.jpg'),
            Image.asset('assets/images/summer_collection.jpg'),
            Image.asset('assets/images/sportswear.jpg'),
          ],
        ),
      ),
    );
  }
}

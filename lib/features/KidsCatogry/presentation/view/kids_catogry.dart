import 'package:flutter/material.dart';

class KidsCatogry extends StatelessWidget {
  const KidsCatogry({super.key});
static String id = 'kids_catogry';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/jacket_kids.jpg'),
            Image.asset('assets/images/sweatshirt_kids.jpg'),
            Image.asset('assets/images/pullover_kids.jpg'),
            Image.asset('assets/images/summer_collection_kids.jpg'),
          ],
        ),
      ),
    );
  }
}

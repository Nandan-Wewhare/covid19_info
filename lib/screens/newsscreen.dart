import 'package:flutter/material.dart';
import 'package:covidinfo/widgets/widgets.dart';
import 'package:covidinfo/constants.dart';
class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbaseColor,
      ),
      backgroundColor: kbaseColor,
      body: Column(
        children: [
            HeadingText(
            text: 'News',
          ),
          NewsCard(),
        ],
      ),
    );
  }
}

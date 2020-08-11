import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbaseColor,
        appBar: AppBar(
          leading: Image.asset('images/appbaricon.jpg'),
          backgroundColor: kbaseColor,
          actions: [
            AppBarButton('News'),
            AppBarButton('About Us'),
          ],
        ),
        body: ListView(
          children: [
            HeadingText(
              text: 'Statistics',
            ),
            StatisticsCard(),
            HeadingText(
              text: 'News',
            ),
            NewsCard()
          ],
        ));
  }
}

class HeadingText extends StatelessWidget {
  HeadingText({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          textScaleFactor: 2.5,
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        height: 500,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: kcontainerColor),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        height: 500,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: kcontainerColor),
        child: ListView(
          children: [
            NewsTile(title: 'News Title', date: '11/08/2020'),
            NewsTile(title: 'News Title', date: '11/08/2020'),
            NewsTile(title: 'News Title', date: '11/08/2020'),
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  NewsTile({this.title, this.date});
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => {},
          title: Text(
            title,
            textScaleFactor: 1.2,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          subtitle: Text(
            date,
            textScaleFactor: 1.2,
            style: GoogleFonts.robotoCondensed(color: Colors.grey),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class AppBarButton extends StatelessWidget {
  AppBarButton(this.name);
  final String name;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        name,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(color: ksecondaryColor),
        ),
      ),
    );
  }
}

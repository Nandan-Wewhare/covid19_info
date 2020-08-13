import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covidinfo/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covidinfo/services/covid.dart';

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

class StatisticsCard extends StatefulWidget {
  StatisticsCard(this.value);
  final int value;
  @override
  _StatisticsCardState createState() => _StatisticsCardState();
}

class _StatisticsCardState extends State<StatisticsCard> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 500,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kcontainerColor,
            ),
            child: FutureBuilder(
              future: fetchAlbum(widget.value),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(
                        snapshot.data.deaths,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(snapshot.data.recovered,
                          style: TextStyle(color: Colors.white))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}",
                      style: GoogleFonts.poppins(color: Colors.white));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
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
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: kcontainerColor),
        child: ListView(
          children: [
            NewsTile(title: 'News Title', date: '11/08/2020'),
            NewsTile(title: 'News Title', date: '11/08/2020'),
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
  AppBarButton(this.name, this.onpressed);
  final String name;
  final Widget onpressed;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => onpressed));
      },
      child: Text(
        name,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(color: ksecondaryColor),
        ),
      ),
    );
  }
}

class TipsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: kcontainerColor),
        child: Column(
          children: [
            TipsTile(
              tip: 'Stay home.\n Especially if you feel unwell.',
              icon: FontAwesomeIcons.home,
            ),
            TipsTile(
              tip: 'Don\'t touch your eyes, nose or mouth.',
              icon: FontAwesomeIcons.eye,
            ),
            TipsTile(
              tip: 'Clean your hands.\n Use soap and water.',
              icon: FontAwesomeIcons.handsWash,
            ),
          ],
        ),
      ),
    );
  }
}

class TipsTile extends StatelessWidget {
  TipsTile({this.tip, this.icon});
  final String tip;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(
              icon,
              color: ksecondaryColor,
              size: 35,
            ),
            title: Text(
              tip,
              textScaleFactor: 0.9,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

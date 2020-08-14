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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Last Updated: ${snapshot.data.lastUpdated}',
                          style: GoogleFonts.openSans(color: Colors.green[200]),
                        ),
                      ),
                      StatisticName('Confirmed', snapshot.data.confirmed),
                      StatisticName('Active', snapshot.data.active),
                      StatisticName('Deaths', snapshot.data.deaths),
                      StatisticName(
                          'Recovery Rate (%)',
                          ((int.parse(snapshot.data.recovered) /
                                      int.parse(snapshot.data.confirmed)) *
                                  100)
                              .toString()
                              .substring(0, 5))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    color: kprimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Something wrong happened.',
                          textScaleFactor: 1.3,
                          style: GoogleFonts.openSans(color: Colors.white)),
                    ),
                  );
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

class StatisticName extends StatelessWidget {
  StatisticName(this.title, this.numbers);
  final String title;
  final String numbers;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$title:',
            textScaleFactor: 1.2,
            style: GoogleFonts.openSans(color: Colors.white),
          ),
        ),
        Text(
          numbers,
          textScaleFactor: 2,
          style: TextStyle(color: ksecondaryColor),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
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
      onPressed: () {
        showAboutDialog(
          context: context,
          applicationName: 'COVID19-Info',
          applicationVersion: '1.0.0',
          applicationIcon: Icon(
            FontAwesomeIcons.virus
          ),
        );
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

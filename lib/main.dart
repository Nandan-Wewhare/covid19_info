import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'widgets/widgets.dart';
import 'screens/newsscreen.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbaseColor,
      appBar: AppBar(
        leading: Image.asset('images/appbaricon.jpg'),
        backgroundColor: kbaseColor,
        actions: [
          AppBarButton('News', News()),
          AppBarButton('About Us', null),
        ],
      ),
      body: ListView(
        children: [
          HeadingText(
            text: 'Statistics',
          ),
          Align(
            alignment: Alignment.center,
            child: DropdownButton(
              iconSize: 30,
              iconEnabledColor: ksecondaryColor,
              dropdownColor: kbaseColor,
              value: _selected ?? 'Total',
              items: kStateList.map((state) {
                return DropdownMenuItem<String>(
                  child: Text(
                    state,
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  value: state,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
          ),
          StatisticsCard(kStateList.indexOf(_selected)+1),
          HeadingText(
            text: 'Tips',
          ),
          TipsCard(),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kcontainerColor),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset('images/doctor.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        'Thousands of doctors lack protective equipment.',
                        textScaleFactor: 1.5,
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  RaisedButton(
                    splashColor: Colors.black,
                    onPressed: () {},
                    color: kprimaryColor,
                    child: Text(
                      'Donate',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                        'All the money collected will be spent to support doctors.',
                        textScaleFactor: 1,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

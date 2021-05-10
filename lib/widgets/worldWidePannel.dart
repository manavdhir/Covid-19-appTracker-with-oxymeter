import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorldWidePannel extends StatelessWidget {
  final Map worldData;

  WorldWidePannel({this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPannel(
            title: 'Confirmed',
            pannelColor: Colors.red[100],
            count: worldData['cases'].toString(),
            textColor: Colors.red,
          ),
          StatusPannel(
            title: 'Active',
            pannelColor: Colors.blue[100],
            count: worldData['active'].toString(),
            textColor: Colors.blue,
          ),
          StatusPannel(
            title: 'Recovered',
            pannelColor: Colors.green[100],
            count: worldData['recovered'].toString(),
            textColor: Colors.green,
          ),
          StatusPannel(
            title: 'Deaths',
            pannelColor: Colors.grey[400],
            count: worldData['deaths'].toString(),
            textColor: Colors.grey[900],
          ),
        ],
      ),
    );
  }
}

class StatusPannel extends StatelessWidget {
  final Color pannelColor;
  final Color textColor;
  final String title;
  final String count;
  StatusPannel({this.count, this.pannelColor, this.textColor, this.title});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ], borderRadius: BorderRadius.circular(15), color: pannelColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.bungee(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}

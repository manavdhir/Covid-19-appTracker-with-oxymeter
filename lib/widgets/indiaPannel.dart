import 'package:flutter/material.dart';
import './worldWidePannel.dart';

class IndiaPannel extends StatelessWidget {
  final Map indiaData;

  IndiaPannel({this.indiaData});

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
            count: indiaData['countries'][1]['confirmed'].toString(),
            textColor: Colors.red,
          ),
          StatusPannel(
            title: 'Active',
            pannelColor: Colors.blue[100],
            count: indiaData['countries'][1]['active'].toString(),
            textColor: Colors.blue,
          ),
          StatusPannel(
            title: 'Recovered',
            pannelColor: Colors.green[100],
            count: indiaData['countries'][1]['recovered'].toString(),
            textColor: Colors.green,
          ),
          StatusPannel(
            title: 'Deaths',
            pannelColor: Colors.grey[400],
            count: indiaData['countries'][1]['deaths'].toString(),
            textColor: Colors.grey[900],
          ),
        ],
      ),
    );
  }
}

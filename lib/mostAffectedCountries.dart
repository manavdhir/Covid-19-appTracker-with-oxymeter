import 'package:flutter/material.dart';

class MostAffectedPannel extends StatelessWidget {
  final Map countryData;
  MostAffectedPannel({this.countryData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Text(
                  countryData['countries'][index]['country'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Deaths : ' +
                      countryData['countries'][0]['deaths'].toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}

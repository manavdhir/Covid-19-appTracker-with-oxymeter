import 'package:covid_19_tracker/data/featuredSymptomData.dart';
import 'package:covid_19_tracker/models/symptom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FeaturedSymptoms extends StatelessWidget {
  _buildFeaturedSymptom(BuildContext context, Symptom symptom) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 250,
      width: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.0, color: Colors.grey[200])),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: NetworkImage(
                symptom.lottieUrl,
              ),
              width: 130,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${symptom.name}',
            style: GoogleFonts.bungee(fontSize: 14, letterSpacing: 0.5),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 5),
            child: Text(
              symptom.type,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: MediaQuery.of(context).size.width - 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: symp.scrollableFeaturedSymptom.length,
        itemBuilder: (BuildContext context, int index) {
          Symptom symptom = symp.scrollableFeaturedSymptom[index];
          return _buildFeaturedSymptom(context, symptom);
        },
      ),
    );
  }
}

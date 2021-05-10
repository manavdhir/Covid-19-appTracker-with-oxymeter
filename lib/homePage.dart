import 'dart:convert';

import 'package:covid_19_tracker/dataSource.dart';
import 'package:covid_19_tracker/models/featuredSymptom.dart';
import 'package:covid_19_tracker/models/scrollableFeaturedSymptoms.dart';
import 'package:covid_19_tracker/widgets/indiaPannel.dart';
import 'package:covid_19_tracker/widgets/worldWidePannel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'mostAffectedCountries.dart';

//-----WORLD WIDE PANNEL LINK ::'https://corona.lmao.ninja/v3/covid-19/all'
//-----DOMESTIC WIDE PANNEL LINK :: 'https://doh.saal.ai/api/live'
//-----COUNTRIES FLAGS PANNEL LINK ::'https://www.countryflags.io/'

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;
  fetchWorldwideData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Map countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://doh.saal.ai/api/live');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Map indiaData;
  fetchIndiaData() async {
    http.Response response = await http.get('https://doh.saal.ai/api/live');
    setState(() {
      indiaData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldwideData();
    fetchCountryData();
    fetchIndiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.health_and_safety,
                  size: 30,
                ),
              ))
        ],
        centerTitle: false,
        title: Text(
          'COVID-19 TRACKER',
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            padding: EdgeInsets.all(10),
            color: Colors.orange[100],
            child: Text(
              DataSource.quote,
              style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Symptoms',
                    style: GoogleFonts.bungee(
                      fontSize: 22,
                      letterSpacing: 0.5,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.medical_services,
                      size: 30,
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
//---------------------------------------------------------
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10, right: 10),
                height: 250,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xfff1e9ce)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Text(
                        'All Symptoms',
                        style: GoogleFonts.bungee(
                            fontSize: 18, letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization.',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
              FeaturedSymptoms(),
            ],
          ),
//----------------------------------------------------------
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Worldwide',
                    style: GoogleFonts.bungee(
                      fontSize: 22,
                      letterSpacing: 0.5,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_right_outlined,
                      size: 40,
                    ),
                  )
                ],
              )),
          worldData == null
              ? CircularProgressIndicator(
                  backgroundColor: Color(0xFF202c3b),
                )
              : WorldWidePannel(
                  worldData: worldData,
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Most Affected Countries',
              style: GoogleFonts.bungee(
                fontSize: 22,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          countryData == null
              ? Container()
              : MostAffectedPannel(
                  countryData: countryData,
                ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'India',
                    style: GoogleFonts.bungee(
                      fontSize: 22,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Regional',
                      style: GoogleFonts.bungee(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              )),
          indiaData == null
              ? CircularProgressIndicator(
                  backgroundColor: Color(0xFF202c3b),
                )
              : IndiaPannel(
                  indiaData: indiaData,
                ),
        ],
      )),
    );
  }
}

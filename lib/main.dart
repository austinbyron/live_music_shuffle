import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'package:web_scraper/web_scraper.dart';

import 'songs_update_backroundplay.dart';
import 'song_url.dart';
import 'song_decode.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'package:web_scraper/web_scraper.dart';

import 'dart:async';
import 'dart:io';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/constants.dart';
import 'song_decode.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'song_url.dart';
import 'dart:math';
import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/constants.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(MyApp());
    });
  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AudioServiceWidget(child: CheckBands()),
      
        
      
    );
  }
}

class CheckBands extends StatefulWidget {
  CheckBands();

  @override
  _CheckBandsState createState() => _CheckBandsState();

}

var gratefulDead = false;
var deadAndCo = false;
var phishBand = false;
var stringCheeseIncident = false;
var billyStrings = false;
var gooseBand = false;
var umphreysMcGee = false;
var derekTrucksBand = false;
var lotusBand = false;
var soundTribeSector9 = false;
var joeRusso = false;
var kellerWilliams = false;
var johnMayer = false;
var tedeschiTrucksBand = false;
var darkStarOrchestra = false;
var myMorningJacket = false;
var moeBand = false;
var littleFeat = false;
var twiddleBand = false;
var weenBand = false;
var spaffordBand = false;
var pigeonsPlayingPingPong = false;
var souliveBand = false;

//add the following bands to appbar button, list, and json stuff
var greenskyBluegrass = false;

//
var philLeshAndFriends = false;
var perpetualGroove = false;

//
var discoBiscuits = false; // done
var crackerBand = false; //done
var yonderMountainStringBand = false; //
var bluesTraveler = false; //
var johnButlerTrio = false; //
var joeRussoHooteroll = false; //
var smashingPumpkins = false; //
var ratDog = false; // 
var theDead = false; //
var vulfpeckBand = false; //
var theOtherOnes = false; //
var jeffAustinBand = false; //
var robertHunter = false; //
var psychedelicBreakfast = false; //
var furthurBand = false; //
var gratefulShred = false;
var garciaPeoples = false;
var hotButteredRum = false;
var jeffersonStarship = false;
var gracePotter = false;
var travelinMcCourys = false;
var bobWeir = false;

var countSelected = 0;
class _CheckBandsState extends State<CheckBands> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select bands to shuffle",
          style: TextStyle(
            color: Colors.grey[100],
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              countSelected == 0 ? Icons.add_circle_outline : Icons.restore,
            ), 
            onPressed: () {
              if (countSelected > 0) {
                
                setState(() {
                
                  gratefulDead = false;
                  deadAndCo = false;
                  phishBand = false;
                  stringCheeseIncident = false;
                  billyStrings = false;
                  gooseBand = false;
                  umphreysMcGee = false;
                  derekTrucksBand = false;
                  lotusBand = false;
                  soundTribeSector9 = false;
                  joeRusso = false;
                  kellerWilliams = false;
                  johnMayer = false;
                  tedeschiTrucksBand = false;
                  darkStarOrchestra = false;
                  myMorningJacket = false;
                  moeBand = false;
                  littleFeat = false;
                  twiddleBand = false;
                  weenBand = false;
                  spaffordBand = false;
                  pigeonsPlayingPingPong = false;
                  souliveBand = false;
                  greenskyBluegrass = false;
                  philLeshAndFriends = false;
                  perpetualGroove = false;
                  discoBiscuits = false;
                  crackerBand = false;
                  yonderMountainStringBand = false;
                  bluesTraveler = false;
                  johnButlerTrio = false;
                  joeRussoHooteroll = false;
                  smashingPumpkins = false;
                  ratDog = false;
                  theDead = false;
                  vulfpeckBand = false;
                  theOtherOnes = false;
                  jeffAustinBand = false;
                  robertHunter = false;
                  psychedelicBreakfast = false;
                  furthurBand = false;
                  gratefulShred = false;
                  countSelected = 0;
                });
              }
              else {
                setState(() {
                
                  gratefulDead = true;
                  deadAndCo = true;
                  phishBand = true;
                  stringCheeseIncident = true;
                  billyStrings = true;
                  gooseBand = true;
                  umphreysMcGee = true;
                  derekTrucksBand = true;
                  lotusBand = true;
                  soundTribeSector9 = true;
                  joeRusso = true;
                  kellerWilliams = true;
                  johnMayer = true;
                  tedeschiTrucksBand = true;
                  darkStarOrchestra = true;
                  myMorningJacket = true;
                  moeBand = true;
                  littleFeat = true;
                  twiddleBand = true;
                  weenBand = true;
                  spaffordBand = true;
                  pigeonsPlayingPingPong = true;
                  souliveBand = true;
                  greenskyBluegrass = true;
                  philLeshAndFriends = true;
                  perpetualGroove = true;
                  discoBiscuits = true;
                  crackerBand = true;
                  yonderMountainStringBand = true;
                  bluesTraveler = true;
                  johnButlerTrio = true;
                  joeRussoHooteroll = true;
                  smashingPumpkins = true;
                  ratDog = true;
                  theDead = true;
                  vulfpeckBand = true;
                  theOtherOnes = true;
                  jeffAustinBand = true;
                  robertHunter = true;
                  psychedelicBreakfast = true;
                  furthurBand = true;
                  gratefulShred = true;
                  countSelected = 42;
                });
              }
              
            }
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check_circle_outline,
          color: Colors.grey[100],
          
        ),
        tooltip: 'Finish selecting bands',
        onPressed: () {
          if (countSelected == 0) {

          }
          else {
            songList.clear();
            songInfo.clear();
            poweredBy.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                MyHomePage()));
          }
        },
      ),
      body: ListView(
      //padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        
        Container(

          height: 50,
          child: Material(
            color: gratefulDead ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  gratefulDead ? Icons.favorite : Icons.favorite_border,
                  color: gratefulDead ? Colors.red : Colors.black,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Grateful Dead",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: gratefulDead ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (gratefulDead == false) {
                  setState(() {
                    gratefulDead = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    gratefulDead = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          //TODO implement phish with api stuff from phish.in
          child: Material(
            color: phishBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),
                Icon(
                  phishBand ? Icons.favorite : Icons.favorite_border,
                  color: phishBand ? Colors.red : Colors.black,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Phish",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: phishBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (phishBand == false) {
                  setState(() {
                    phishBand = true;
                    countSelected++;
                  });
                  print(countSelected);
                }

                else {
                  setState(() {
                    phishBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: billyStrings ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: billyStrings ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Billy Strings",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: billyStrings ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (billyStrings == false) {
                  setState(() {
                    billyStrings = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    billyStrings = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: bluesTraveler? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: bluesTraveler ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Blues Traveler",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: bluesTraveler ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (bluesTraveler == false) {
                  setState(() {
                    bluesTraveler = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    bluesTraveler = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: crackerBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: crackerBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Cracker",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: crackerBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (crackerBand== false) {
                  setState(() {
                    crackerBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    crackerBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: darkStarOrchestra ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: darkStarOrchestra ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Dark Star Orchestra",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: darkStarOrchestra ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (darkStarOrchestra == false) {
                  setState(() {
                    darkStarOrchestra= true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    darkStarOrchestra = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: theDead ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: theDead ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "The Dead",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: theDead ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (theDead == false) {
                  setState(() {
                    theDead = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    theDead = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(
          height: 50,
          child: Material(
            color: deadAndCo ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: deadAndCo ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Dead & Company",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: deadAndCo ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (deadAndCo == false) {
                  setState(() {
                    deadAndCo = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    deadAndCo = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: derekTrucksBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: derekTrucksBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Derek Trucks Band",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: derekTrucksBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (derekTrucksBand == false) {
                  setState(() {
                    derekTrucksBand = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    derekTrucksBand = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(

          height: 50,
          child: Material(
            color: discoBiscuits ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: discoBiscuits ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Disco Biscuits",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: discoBiscuits ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (discoBiscuits == false) {
                  setState(() {
                    discoBiscuits = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    discoBiscuits = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: furthurBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: furthurBand? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Furthur",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: furthurBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (furthurBand == false) {
                  setState(() {
                    furthurBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    furthurBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ), 

        //garcia peoples

        Container(
          height: 50,
          child: Material(
            color: gooseBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: gooseBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Goose",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: gooseBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (gooseBand == false) {
                  setState(() {
                    gooseBand = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    gooseBand = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(
          height: 50,
          child: Material(
            color: gratefulShred ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: gratefulShred ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Grateful Shred",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: gratefulShred ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (gratefulShred == false) {
                  setState(() {
                    gratefulShred= true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    gratefulShred = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: greenskyBluegrass ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: greenskyBluegrass ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Greensky Bluegrass",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: greenskyBluegrass ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (greenskyBluegrass == false) {
                  setState(() {
                    greenskyBluegrass = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    greenskyBluegrass = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        //hot buttered rum

        Container(
          height: 50,
          child: Material(
            color: jeffAustinBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: jeffAustinBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Jeff Austin Band",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: jeffAustinBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (jeffAustinBand == false) {
                  setState(() {
                    jeffAustinBand = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    jeffAustinBand = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        //jefferson starship


        Container(
          height: 50,
          child: Material(
            color: joeRusso ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: joeRusso ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Joe Russo's Almost Dead",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: joeRusso ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (joeRusso == false) {
                  setState(() {
                    joeRusso = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    joeRusso = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: joeRussoHooteroll ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: joeRussoHooteroll ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                AutoSizeText(
                  "Joe Russo's Presents: Hooteroll? + Plus",
                  minFontSize: 17.0,
                  maxFontSize: 22,
                  maxLines: 1,
                  style: TextStyle(
                    //fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: joeRussoHooteroll ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (joeRussoHooteroll== false) {
                  setState(() {
                    joeRussoHooteroll = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    joeRussoHooteroll = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(
          height: 50,
          child: Material(
            color: johnButlerTrio ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: johnButlerTrio ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "John Butler Trio",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: johnButlerTrio ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (johnButlerTrio == false) {
                  setState(() {
                    johnButlerTrio = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    johnButlerTrio = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: johnMayer ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: johnMayer ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "John Mayer",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: johnMayer ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (johnMayer == false) {
                  setState(() {
                    johnMayer = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    johnMayer = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(
          height: 50,
          child: Material(
            color: kellerWilliams ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: kellerWilliams ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Keller Williams",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: kellerWilliams ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (kellerWilliams == false) {
                  setState(() {
                    kellerWilliams = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    kellerWilliams = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(

          height: 50,
          child: Material(
            color: littleFeat ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: littleFeat ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Little Feat",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: littleFeat ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (littleFeat == false) {
                  setState(() {
                    littleFeat = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    littleFeat = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: lotusBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: lotusBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Lotus",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: lotusBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (lotusBand == false) {
                  setState(() {
                    lotusBand = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    lotusBand = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: moeBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: moeBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "moe.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: moeBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (moeBand == false) {
                  setState(() {
                    moeBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    moeBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: myMorningJacket ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: myMorningJacket ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "My Morning Jacket",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: myMorningJacket ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (myMorningJacket == false) {
                  setState(() {
                    myMorningJacket = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    myMorningJacket = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: theOtherOnes ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: theOtherOnes ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "The Other Ones",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: theOtherOnes ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (theOtherOnes == false) {
                  setState(() {
                    theOtherOnes = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    theOtherOnes = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: perpetualGroove ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: perpetualGroove ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Perpetual Groove",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: perpetualGroove ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (perpetualGroove == false) {
                  setState(() {
                    perpetualGroove = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    perpetualGroove = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: philLeshAndFriends ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: philLeshAndFriends ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Phil Lesh and Friends",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: philLeshAndFriends ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (philLeshAndFriends == false) {
                  setState(() {
                    philLeshAndFriends = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    philLeshAndFriends = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(

          height: 50,
          child: Material(
            color: pigeonsPlayingPingPong ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: pigeonsPlayingPingPong ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Pigeons Playing Ping Pong",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: pigeonsPlayingPingPong ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (pigeonsPlayingPingPong == false) {
                  setState(() {
                    pigeonsPlayingPingPong = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    pigeonsPlayingPingPong = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(

          height: 50,
          child: Material(
            color: psychedelicBreakfast ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: psychedelicBreakfast ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Psychedelic Breakfast",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: psychedelicBreakfast ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (psychedelicBreakfast == false) {
                  setState(() {
                    psychedelicBreakfast = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    psychedelicBreakfast = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: ratDog ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: ratDog ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Ratdog",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: ratDog ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (ratDog == false) {
                  setState(() {
                    ratDog = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    ratDog = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),

        Container(

          height: 50,
          child: Material(
            color: robertHunter ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: robertHunter ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Robert Hunter",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: robertHunter ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (robertHunter == false) {
                  setState(() {
                    robertHunter = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    robertHunter = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),

        
        Container(

          height: 50,
          child: Material(
            color: smashingPumpkins ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: smashingPumpkins ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Smashing Pumpkins",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: smashingPumpkins ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (smashingPumpkins == false) {
                  setState(() {
                    smashingPumpkins = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    smashingPumpkins = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        Container(

          height: 50,
          child: Material(
            color: souliveBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: souliveBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Soulive",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: souliveBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (souliveBand == false) {
                  setState(() {
                    souliveBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    souliveBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        
        Container(
          height: 50,
          child: Material(
            color: soundTribeSector9 ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: soundTribeSector9 ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Sound Tribe Sector 9",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: soundTribeSector9 ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (soundTribeSector9 == false) {
                  setState(() {
                    soundTribeSector9 = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    soundTribeSector9 = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        
        Container(

          height: 50,
          child: Material(
            color: spaffordBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: spaffordBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Spafford",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: spaffordBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (spaffordBand == false) {
                  setState(() {
                    spaffordBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    spaffordBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        
        Container(
          height: 50,
          child: Material(
            color: stringCheeseIncident ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: stringCheeseIncident ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "String Cheese Incident",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: stringCheeseIncident ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (stringCheeseIncident == false) {
                  setState(() {
                    stringCheeseIncident = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    stringCheeseIncident = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        Container(
          height: 50,
          child: Material(
            color: tedeschiTrucksBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: tedeschiTrucksBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Tedeschi Trucks Band",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: tedeschiTrucksBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (tedeschiTrucksBand == false) {
                  setState(() {
                    tedeschiTrucksBand = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    tedeschiTrucksBand = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        
        Container(

          height: 50,
          child: Material(
            color: twiddleBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: twiddleBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Twiddle",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: twiddleBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (twiddleBand == false) {
                  setState(() {
                    twiddleBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    twiddleBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        
        Container(
          height: 50,
          child: Material(
            color: umphreysMcGee ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: umphreysMcGee ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Umphrey's McGee",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: umphreysMcGee ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (umphreysMcGee == false) {
                  setState(() {
                    umphreysMcGee = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    umphreysMcGee = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),
        
        Container(
          height: 50,
          child: Material(
            color: vulfpeckBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10, width: 10),
                Icon(
                  Icons.favorite,
                  color: vulfpeckBand? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Vulfpeck",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: vulfpeckBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (vulfpeckBand== false) {
                  setState(() {
                    vulfpeckBand = true;
                    countSelected++;
                  });
                }
                else {
                  setState(() {
                    vulfpeckBand = false;
                    countSelected--;
                  });
                }
              },
            ),
          ),
        ),          
        
        Container(

          height: 50,
          child: Material(
            color: weenBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: weenBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Ween",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: weenBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (weenBand == false) {
                  setState(() {
                    weenBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    weenBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
        
        Container(

          height: 50,
          child: Material(
            color: yonderMountainStringBand ? Colors.blue[300] : Colors.white,
            child: InkWell(
              splashColor: Colors.blue[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(height: 10, width: 10),  
                Icon(
                  Icons.favorite,
                  color: yonderMountainStringBand ? Colors.red : Colors.white,
                ),
                SizedBox(height: 10, width: 10),
                Text(
                  "Yonder Mountain String Band",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: yonderMountainStringBand ? Colors.white : Colors.black,
                  ),
                ),
                ],
              ),
              onTap: () {
                if (yonderMountainStringBand == false) {
                  setState(() {
                    yonderMountainStringBand = true;
                    countSelected++;
                    
                  });
                  print(countSelected);
                }
                else {
                  setState(() {
                    yonderMountainStringBand = false;
                    countSelected--;
                  });
                  print(countSelected);
                }
              },
            ),
          ),
        ),
      ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
final count = 5;
var tracker = 0;
class _MyHomePageState extends State<MyHomePage> {

    Future<void> _retrieveLocalSongInfo() async {

    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    if (deadAndCo == true) {
    final json = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/deadandco.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Show> songStuff =
          data[key].map<Show>((dynamic data) => Show.fromJson(data)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff,
        
      );
      for (var counter = 0; counter < songStuff.length; counter++) {
        if (songStuff[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (gratefulDead == true) {
    final json2 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/gratefuldeadsoundboards.json');
    final data2 = JsonDecoder().convert(await json2);
    if (data2 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data2.keys.forEach((key) {
      final List<Show> songStuff2 =
          data2[key].map<Show>((dynamic data2) => Show.fromJson(data2)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff2,
        
      );
      for (var counter = 0; counter < songStuff2.length; counter++) {
        if (songStuff2[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });

    print(songList.length);
    tracker++;
    }

    if (phishBand == true) {
      final jsonph = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/phish.json');
    final dataph = JsonDecoder().convert(await jsonph);
    if (dataph is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    dataph.keys.forEach((key) {
      final List<Show> songStuffph =
          dataph[key].map<Show>((dynamic dataph) => Show.fromJson(dataph)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuffph,
        
      );
      for (var counter = 0; counter < songStuffph.length; counter++) {
        if (songStuffph[counter].format == "VBR MP3") {
          songList.add("${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Phish.in");
        }
        
      }

      
     
    });

    print(songList.length);
    tracker++;
    }

    if (umphreysMcGee == true) {
    final json3 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/umphreys.json');
    final data3 = JsonDecoder().convert(await json3);
    if (data3 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data3.keys.forEach((key) {
      final List<Show> songStuff3 =
          data3[key].map<Show>((dynamic data3) => Show.fromJson(data3)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff3,
        
      );
      
      for (var counter = 0; counter < songStuff3.length; counter++) {
        if (songStuff3[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });

    print(songList.length);
    tracker++;
    }

    if (billyStrings == true) {
    final json4 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/billystrings.json');
    final data4 = JsonDecoder().convert(await json4);
    if (data4 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data4.keys.forEach((key) {
      final List<Show> songStuff4 =
          data4[key].map<Show>((dynamic data4) => Show.fromJson(data4)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff4,
        
      );
      for (var counter = 0; counter < songStuff4.length; counter++) {
        if (songStuff4[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });

    print(songList.length);
    tracker++;
    }

    if (gooseBand == true) {
    final json5 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/goose.json');
    final data5 = JsonDecoder().convert(await json5);
    if (data5 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data5.keys.forEach((key) {
      final List<Show> songStuff5 =
          data5[key].map<Show>((dynamic data5) => Show.fromJson(data5)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff5,
        
      );
      for (var counter = 0; counter < songStuff5.length; counter++) {
        if (songStuff5[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });

    print(songList.length);
    tracker++;
    }

    if (stringCheeseIncident == true) {
    final json6 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/sci.json');
    final data6 = JsonDecoder().convert(await json6);
    if (data6 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data6.keys.forEach((key) {
      final List<Show> songStuff6 =
          data6[key].map<Show>((dynamic data6) => Show.fromJson(data6)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff6,
        
      );
      for (var counter = 0; counter < songStuff6.length; counter++) {
        if (songStuff6[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });

    print(songList.length);
    tracker++;
    }

    //todo add derek trucks band and lotus
    if (derekTrucksBand == true) {
      final json7 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/derektrucksband.json');
    final data7 = JsonDecoder().convert(await json7);
    if (data7 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data7.keys.forEach((key) {
      final List<Show> songStuff7 =
          data7[key].map<Show>((dynamic data7) => Show.fromJson(data7)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff7,
        
      );
      for (var counter = 0; counter < songStuff7.length; counter++) {
        if (songStuff7[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (lotusBand == true) {
      final json8 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/lotus.json');
    final data8 = JsonDecoder().convert(await json8);
    if (data8 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data8.keys.forEach((key) {
      final List<Show> songStuff8 =
          data8[key].map<Show>((dynamic data8) => Show.fromJson(data8)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff8,
        
      );
      for (var counter = 0; counter < songStuff8.length; counter++) {
        if (songStuff8[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (soundTribeSector9 == true) {
      final json9 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/sts9.json');
    final data9 = JsonDecoder().convert(await json9);
    if (data9 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data9.keys.forEach((key) {
      final List<Show> songStuff9 =
          data9[key].map<Show>((dynamic data9) => Show.fromJson(data9)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff9,
        
      );
      for (var counter = 0; counter < songStuff9.length; counter++) {
        if (songStuff9[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (joeRusso == true) {
          final json10 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/joerusso.json');
    final data10 = JsonDecoder().convert(await json10);
    if (data10 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data10.keys.forEach((key) {
      final List<Show> songStuff10 =
          data10[key].map<Show>((dynamic data10) => Show.fromJson(data10)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff10,
        
      );
      for (var counter = 0; counter < songStuff10.length; counter++) {
        if (songStuff10[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (kellerWilliams == true) {
      final json11 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/kellerwilliams.json');
    final data11 = JsonDecoder().convert(await json11);
    if (data11 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data11.keys.forEach((key) {
      final List<Show> songStuff11 =
          data11[key].map<Show>((dynamic data11) => Show.fromJson(data11)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff11,
        
      );
      for (var counter = 0; counter < songStuff11.length; counter++) {
        if (songStuff11[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (johnMayer == true) {
        final json12 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/johnmayer.json');
    final data12 = JsonDecoder().convert(await json12);
    if (data12 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data12.keys.forEach((key) {
      final List<Show> songStuff12 =
          data12[key].map<Show>((dynamic data12) => Show.fromJson(data12)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff12,
        
      );
      for (var counter = 0; counter < songStuff12.length; counter++) {
        if (songStuff12[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (tedeschiTrucksBand == true) {
      final json13 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/tedeschitrucksband.json');
    final data13 = JsonDecoder().convert(await json13);
    if (data13 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data13.keys.forEach((key) {
      final List<Show> songStuff13 =
          data13[key].map<Show>((dynamic data13) => Show.fromJson(data13)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff13,
        
      );
      for (var counter = 0; counter < songStuff13.length; counter++) {
        if (songStuff13[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (darkStarOrchestra == true) {
      final json14 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/darkstarorchestra.json');
    final data14 = JsonDecoder().convert(await json14);
    if (data14 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data14.keys.forEach((key) {
      final List<Show> songStuff14 =
          data14[key].map<Show>((dynamic data14) => Show.fromJson(data14)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff14,
        
      );
      for (var counter = 0; counter < songStuff14.length; counter++) {
        if (songStuff14[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (myMorningJacket == true) {
      final json15 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/mymorningjacket.json');
    final data15 = JsonDecoder().convert(await json15);
    if (data15 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data15.keys.forEach((key) {
      final List<Show> songStuff15 =
          data15[key].map<Show>((dynamic data15) => Show.fromJson(data15)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff15,
        
      );
      for (var counter = 0; counter < songStuff15.length; counter++) {
        if (songStuff15[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (moeBand == true) {

      final json16 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/moe.json');
    final data16 = JsonDecoder().convert(await json16);
    if (data16 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data16.keys.forEach((key) {
      final List<Show> songStuff16 =
          data16[key].map<Show>((dynamic data16) => Show.fromJson(data16)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff16,
        
      );
      for (var counter = 0; counter < songStuff16.length; counter++) {
        if (songStuff16[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (littleFeat == true) {
        final json17 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/littlefeat.json');
    final data17 = JsonDecoder().convert(await json17);
    if (data17 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data17.keys.forEach((key) {
      final List<Show> songStuff17 =
          data17[key].map<Show>((dynamic data17) => Show.fromJson(data17)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff17,
        
      );
      for (var counter = 0; counter < songStuff17.length; counter++) {
        if (songStuff17[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (twiddleBand == true) {
      final json18 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/twiddle.json');
    final data18 = JsonDecoder().convert(await json18);
    if (data18 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data18.keys.forEach((key) {
      final List<Show> songStuff18 =
          data18[key].map<Show>((dynamic data18) => Show.fromJson(data18)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff18,
        
      );
      for (var counter = 0; counter < songStuff18.length; counter++) {
        if (songStuff18[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (weenBand == true) {
      final json19 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/ween.json');
    final data19 = JsonDecoder().convert(await json19);
    if (data19 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data19.keys.forEach((key) {
      final List<Show> songStuff19 =
          data19[key].map<Show>((dynamic data19) => Show.fromJson(data19)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff19,
        
      );
      for (var counter = 0; counter < songStuff19.length; counter++) {
        if (songStuff19[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (spaffordBand == true) {
      final json20 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/spafford.json');
    final data20 = JsonDecoder().convert(await json20);
    if (data20 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data20.keys.forEach((key) {
      final List<Show> songStuff20 =
          data20[key].map<Show>((dynamic data20) => Show.fromJson(data20)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff20,
        
      );
      for (var counter = 0; counter < songStuff20.length; counter++) {
        if (songStuff20[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (pigeonsPlayingPingPong == true) {
      final json21 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/pigeonsplayingpingpong.json');
    final data21 = JsonDecoder().convert(await json21);
    if (data21 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data21.keys.forEach((key) {
      final List<Show> songStuff21 =
          data21[key].map<Show>((dynamic data21) => Show.fromJson(data21)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff21,
        
      );
      for (var counter = 0; counter < songStuff21.length; counter++) {
        if (songStuff21[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (souliveBand == true) {
        final json22 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/soulive.json');
    final data22 = JsonDecoder().convert(await json22);
    if (data22 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data22.keys.forEach((key) {
      final List<Show> songStuff22 =
          data22[key].map<Show>((dynamic data22) => Show.fromJson(data22)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff22,
        
      );
      for (var counter = 0; counter < songStuff22.length; counter++) {
        if (songStuff22[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (greenskyBluegrass == true) {
          final json23 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/greenskybluegrass.json');
    final data23 = JsonDecoder().convert(await json23);
    if (data23 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data23.keys.forEach((key) {
      final List<Show> songStuff23 =
          data23[key].map<Show>((dynamic data23) => Show.fromJson(data23)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff23,
        
      );
      for (var counter = 0; counter < songStuff23.length; counter++) {
        if (songStuff23[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (philLeshAndFriends == true) {
      final json24 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/philleshandfriends.json');
    final data24 = JsonDecoder().convert(await json24);
    if (data24 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data24.keys.forEach((key) {
      final List<Show> songStuff24 =
          data24[key].map<Show>((dynamic data24) => Show.fromJson(data24)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff24,
        
      );
      for (var counter = 0; counter < songStuff24.length; counter++) {
        if (songStuff24[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (perpetualGroove == true) {
        final json25 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/perpetualgroove.json');
    final data25 = JsonDecoder().convert(await json25);
    if (data25 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data25.keys.forEach((key) {
      final List<Show> songStuff25 =
          data25[key].map<Show>((dynamic data25) => Show.fromJson(data25)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff25,
        
      );
      for (var counter = 0; counter < songStuff25.length; counter++) {
        if (songStuff25[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (discoBiscuits == true) {
      final json26 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/discobiscuits.json');
    final data26 = JsonDecoder().convert(await json26);
    if (data26 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data26.keys.forEach((key) {
      final List<Show> songStuff26 =
          data26[key].map<Show>((dynamic data26) => Show.fromJson(data26)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff26,
        
      );
      for (var counter = 0; counter < songStuff26.length; counter++) {
        if (songStuff26[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (crackerBand == true) {
        final json27 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/cracker.json');
    final data27 = JsonDecoder().convert(await json27);
    if (data27 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data27.keys.forEach((key) {
      final List<Show> songStuff27 =
          data27[key].map<Show>((dynamic data27) => Show.fromJson(data27)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff27,
        
      );
      for (var counter = 0; counter < songStuff27.length; counter++) {
        if (songStuff27[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (yonderMountainStringBand == true) {
          final json28 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/yondermountainstringband.json');
    final data28 = JsonDecoder().convert(await json28);
    if (data28 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data28.keys.forEach((key) {
      final List<Show> songStuff28 =
          data28[key].map<Show>((dynamic data28) => Show.fromJson(data28)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff28,
        
      );
      for (var counter = 0; counter < songStuff28.length; counter++) {
        if (songStuff28[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (bluesTraveler == true) {
            final json29 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/bluestraveler.json');
    final data29 = JsonDecoder().convert(await json29);
    if (data29 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data29.keys.forEach((key) {
      final List<Show> songStuff29 =
          data29[key].map<Show>((dynamic data29) => Show.fromJson(data29)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff29,
        
      );
      for (var counter = 0; counter < songStuff29.length; counter++) {
        if (songStuff29[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (johnButlerTrio == true) {
              final json30 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/johnbutlertrio.json');
    final data30 = JsonDecoder().convert(await json30);
    if (data30 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data30.keys.forEach((key) {
      final List<Show> songStuff30 =
          data30[key].map<Show>((dynamic data30) => Show.fromJson(data30)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff30,
        
      );
      for (var counter = 0; counter < songStuff30.length; counter++) {
        if (songStuff30[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (joeRussoHooteroll == true) {
                final json31 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/joerussohooteroll.json');
    final data31 = JsonDecoder().convert(await json31);
    if (data31 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data31.keys.forEach((key) {
      final List<Show> songStuff31 =
          data31[key].map<Show>((dynamic data31) => Show.fromJson(data31)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff31,
        
      );
      for (var counter = 0; counter < songStuff31.length; counter++) {
        if (songStuff31[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (smashingPumpkins == true) {
                final json32 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/smashingpumpkins.json');
    final data32 = JsonDecoder().convert(await json32);
    if (data32 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data32.keys.forEach((key) {
      final List<Show> songStuff32 =
          data32[key].map<Show>((dynamic data32) => Show.fromJson(data32)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff32,
        
      );
      for (var counter = 0; counter < songStuff32.length; counter++) {
        if (songStuff32[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (ratDog == true) {
                final json33 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/ratdog.json');
    final data33 = JsonDecoder().convert(await json33);
    if (data33 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data33.keys.forEach((key) {
      final List<Show> songStuff33 =
          data33[key].map<Show>((dynamic data33) => Show.fromJson(data33)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff33,
        
      );
      for (var counter = 0; counter < songStuff33.length; counter++) {
        if (songStuff33[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (theDead == true) {
                final json34 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/thedead.json');
    final data34 = JsonDecoder().convert(await json34);
    if (data34 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data34.keys.forEach((key) {
      final List<Show> songStuff34 =
          data34[key].map<Show>((dynamic data34) => Show.fromJson(data34)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff34,
        
      );
      for (var counter = 0; counter < songStuff34.length; counter++) {
        if (songStuff34[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (vulfpeckBand == true) {
                final json35 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/vulfpeck.json');
    final data35 = JsonDecoder().convert(await json35);
    if (data35 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data35.keys.forEach((key) {
      final List<Show> songStuff35 =
          data35[key].map<Show>((dynamic data35) => Show.fromJson(data35)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff35,
        
      );
      for (var counter = 0; counter < songStuff35.length; counter++) {
        if (songStuff35[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (theOtherOnes == true) {
                final json36 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/theotherones.json');
    final data36 = JsonDecoder().convert(await json36);
    if (data36 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data36.keys.forEach((key) {
      final List<Show> songStuff36 =
          data36[key].map<Show>((dynamic data36) => Show.fromJson(data36)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff36,
        
      );
      for (var counter = 0; counter < songStuff36.length; counter++) {
        if (songStuff36[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (jeffAustinBand == true) {
                final json37 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/jeffaustinband.json');
    final data37 = JsonDecoder().convert(await json37);
    if (data37 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data37.keys.forEach((key) {
      final List<Show> songStuff37 =
          data37[key].map<Show>((dynamic data37) => Show.fromJson(data37)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff37,
        
      );
      for (var counter = 0; counter < songStuff37.length; counter++) {
        if (songStuff37[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }

    if (robertHunter == true) {
                final json38 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/roberthunter.json');
    final data38 = JsonDecoder().convert(await json38);
    if (data38 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data38.keys.forEach((key) {
      final List<Show> songStuff38 =
          data38[key].map<Show>((dynamic data38) => Show.fromJson(data38)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff38,
        
      );
      for (var counter = 0; counter < songStuff38.length; counter++) {
        if (songStuff38[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (psychedelicBreakfast == true) {
                final json39 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/psychedelicbreakfast.json');
    final data39 = JsonDecoder().convert(await json39);
    if (data39 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data39.keys.forEach((key) {
      final List<Show> songStuff39 =
          data39[key].map<Show>((dynamic data39) => Show.fromJson(data39)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff39,
        
      );
      for (var counter = 0; counter < songStuff39.length; counter++) {
        if (songStuff39[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (furthurBand == true) {
                final json40 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/furthur.json');
    final data40 = JsonDecoder().convert(await json40);
    if (data40 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data40.keys.forEach((key) {
      final List<Show> songStuff40 =
          data40[key].map<Show>((dynamic data40) => Show.fromJson(data40)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff40,
        
      );
      for (var counter = 0; counter < songStuff40.length; counter++) {
        if (songStuff40[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
    if (gratefulShred == true) {
                final json41 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/gratefulshred.json');
    final data41 = JsonDecoder().convert(await json41);
    if (data41 is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    //Show stuff = Show();
    //var categoryIndex = 0;
    data41.keys.forEach((key) {
      final List<Show> songStuff41 =
          data41[key].map<Show>((dynamic data41) => Show.fromJson(data41)).toList();
      var _songUrl = SongUrl(
        showName: key,
        files: songStuff41,
        
      );
      for (var counter = 0; counter < songStuff41.length; counter++) {
        if (songStuff41[counter].format == "VBR MP3") {
          songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
          poweredBy.add("Archive.org");
        }
        
      }

      
     
    });
    tracker++;
    print(songList.length);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    _retrieveLocalSongInfo();
    return Scaffold(
      
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Material(
            color: Colors.grey[100],
            child: InkWell(
              splashColor: Colors.grey[400],
              child: Center(
                child: Text(
                    "Listen to some tunes?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 38.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                
              ),
              onTap: () async {
                if (songList[0] == null) {
                  _retrieveLocalSongInfo();
                }
                if (tracker != count) {

                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                SongUI()));
              },
            ),
          ),
   
          
        ),
      ),
      //floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


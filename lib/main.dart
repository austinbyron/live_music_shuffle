import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'package:web_scraper/web_scraper.dart';

import 'songs_update_backroundplay.dart';
import 'song_url.dart';
import 'song_decode.dart';
import 'mediaitemmaker.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      myBands.sort((a,b) {
        return a.order.toLowerCase().compareTo(b.order.toLowerCase());
      });
      runApp(MyApp());
    });

}

List<String> songURL = new List();
List<String> songTitle = new List();
List<String> songArtist = new List();
List<String> songAlbumDate = new List();
List<String> songSource = new List();

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
      home: CheckBands(),
      
        
      
    );
  }
}

class CheckBands extends StatefulWidget {
  CheckBands();

  @override
  _CheckBandsState createState() => _CheckBandsState();

}

class BandMaker {

  String bandName;
  String search;
  bool selected;
  Color colorSelected;
  Color colorUnselected;
  IconData iconSelected;
  IconData iconUnselected;
  String jsonFile;
  String order; //to add so that bands can be added in any order and makes
                //the code more scalable

  BandMaker({@required String bandName, @required String search,
              @required bool selected, @required Color colorSelected, 
              @required Color colorUnselected, @required IconData iconSelected, 
              @required IconData iconUnselected, @required String jsonFile,
              @required String order}) {
    this.bandName = bandName;
    this.search = search;
    this.selected = selected;
    this.colorSelected = colorSelected;
    this.colorUnselected = colorUnselected;
    this.iconSelected = iconSelected;
    this.iconUnselected = iconUnselected;
    this.jsonFile = jsonFile;
    this.order = order;
  }
}

List<BandMaker> myBands = [
  new BandMaker(bandName: "Grateful Dead", search: "gratefuldead", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.black, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite_border, 
                jsonFile: 'assets/data/gratefuldeadsoundboards.json',
                order: "!Grateful Dead"),
  new BandMaker(bandName: "Phish", search: "phish", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.black, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite_border, 
                jsonFile: 'assets/data/phish.json',
                order: "!Phish"),
  new BandMaker(bandName: "Billy Strings", search: "billystrings", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/billystrings.json',
                order: "Billy Strings"),
  new BandMaker(bandName: "Blues Traveler", search: "bluestraveler", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/bluestraveler.json',
                order: "Blues Traveler"),
  new BandMaker(bandName: "Bob Weir", search: "bobweir", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/bobweir.json',
                order: "Bob Weir"),
  new BandMaker(bandName: "Cracker", search: "cracker", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/cracker.json',
                order: "Cracker"),
  new BandMaker(bandName: "Dark Star Orchestra", search: "darkstarorchestra", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/darkstarorchestra.json',
                order: "Cracker"),
  new BandMaker(bandName: "The Dead", search: "thedead", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/thedead.json',
                order: "Dead"),
  new BandMaker(bandName: "Dead and Co", search: "deadandco", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/deadandco.json',
                order: "Dead and Co"),
  new BandMaker(bandName: "Derek Trucks Band", search: "derektrucksband", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/derektrucksband.json',
                order: "Derek Trucks Band"),
  new BandMaker(bandName: "Disco Biscuits", search: "discobiscuits", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/discobiscuits.json',
                order: "Disco Biscuits"),
  new BandMaker(bandName: "Furthur", search: "furthur", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/furthur.json',
                order: "Furthur"),
  new BandMaker(bandName: "Garcia Peoples", search: "garciapeoples", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/garciapeoples.json',
                order: "Garcia Peoples"),
  new BandMaker(bandName: "Goose", search: "goose", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/goose.json',
                order: "Goose"),
  new BandMaker(bandName: "Grace Potter and the Nocturnals", search: "gracepotter", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/gracepotter.json',
                order: "Grace Potter and the Nocturnals"),
  new BandMaker(bandName: "Grateful Shred", search: "gratefulshred", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/gratefulshred.json',
                order: "Grateful Shred"),
  new BandMaker(bandName: "Greensky Bluegrass", search: "greenskybluegrass", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/greenskybluegrass.json',
                order: "Greensky Bluegrass"),
  new BandMaker(bandName: "Hot Buttered Rum", search: "hotbutteredrum", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/hotbutteredrum.json',
                order: "Hot Buttered Rum"),
  new BandMaker(bandName: "Jeff Austin Band", search: "jeffaustinband", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/jeffaustinband.json',
                order: "Jeff Austin Band"),
  new BandMaker(bandName: "Jefferson Starship", search: "jeffersonstarship", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/jeffersonstarship.json',
                order: "Jefferson Starship"),
  new BandMaker(bandName: "Joe Russo's Almost Dead", search: "joerusso", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/joerusso.json',
                order: "Joe Russo's Almost Dead"),
  new BandMaker(bandName: "Joe Russo Presents: Hooteroll? + Plus", search: "joerussohooteroll", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/joerussohooteroll.json',
                order: "Joe Russo Presents: Hooteroll? + Plus"),
  new BandMaker(bandName: "John Butler Trio", search: "johnbutlertrio", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/johnbutlertrio.json',
                order: "John Butler Trio"),
  new BandMaker(bandName: "John Mayer", search: "johnmayer", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/johnmayer.json',
                order: "John Mayer"),
  new BandMaker(bandName: "Keller Williams", search: "kellerwilliams", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/kellerwilliams.json',
                order: "Keller Williams"),
  new BandMaker(bandName: "Little Feat", search: "littlefeat", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/littlefeat.json',
                order: "Little Feat"),
  new BandMaker(bandName: "Lotus", search: "lotus", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/lotus.json',
                order: "Lotus"),
  new BandMaker(bandName: "moe.", search: "moe", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/moe.json',
                order: "moe."),
  new BandMaker(bandName: "My Morning Jacket", search: "mymorningjacket", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/mymorningjacket.json',
                order: "My Morning Jacket"),
  new BandMaker(bandName: "The Other Ones", search: "theotherones", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/theotherones.json',
                order: "Other Ones"),
  new BandMaker(bandName: "Perpetual Groove", search: "perpetualgroove", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/perpetualgroove.json',
                order: "Perpetual Groove"),
  new BandMaker(bandName: "Phil Lesh and Friends", search: "philleshandfriends", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/philleshandfriends.json',
                order: "Phil Lesh and Friends"),
  new BandMaker(bandName: "Pigeons Playing Ping Pong", search: "pigeonsplayingpingpong", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/pigeonsplayingpingpong.json',
                order: "Pigeons Playing Ping Pong"),
  new BandMaker(bandName: "Psychedelic Breakfast", search: "psychedelicbreakfast", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/psychedelicbreakfast.json',
                order: "Psychedelic Breakfast"),
  new BandMaker(bandName: "Ratdog", search: "ratdog", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/ratdog.json',
                order: "Ratdog"),
  new BandMaker(bandName: "Robert Hunter", search: "roberthunter", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/roberthunter.json',
                order: "Robert Hunter"),
  new BandMaker(bandName: "Smashing Pumpkins", search: "smashingpumpkins", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/smashingpumpkins.json',
                order: "Smashing Pumpkins"),
  new BandMaker(bandName: "Soulive", search: "soulive", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/soulive.json',
                order: "Soulive"),
  new BandMaker(bandName: "Sound Tribe Sector 9", search: "soundtribesector9", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/sts9.json',
                order: "Sound Tribe Sector 9"),
  new BandMaker(bandName: "Spafford", search: "spafford", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/spafford.json',
                order: "Spafford"),
  new BandMaker(bandName: "String Cheese Incident", search: "stringcheeseincident", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/sci.json',
                order: "String Cheese Incident"),  
  new BandMaker(bandName: "Tedeschi Trucks Band", search: "tedeschitrucksband", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/tedeschitrucksband.json',
                order: "Tedeschi Trucks Band"),
  new BandMaker(bandName: "The Travelin' McCourys", search: "thetravelinmccourys", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/travelinmccourys.json',
                order: "Travelin' McCourys"),
  new BandMaker(bandName: "Twiddle", search: "twiddle", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/twiddle.json',
                order: "Twiddle"),
  new BandMaker(bandName: "Umphreys McGee", search: "umphreysmcgee", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/umphreys.json',
                order: "Umphreys McGee"),
  new BandMaker(bandName: "Vulfpeck", search: "vulfpeck", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/vulfpeck.json',
                order: "Vulfpeck"),
  new BandMaker(bandName: "Ween", search: "ween", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/ween.json',
                order: "Ween"),
  new BandMaker(bandName: "the werks", search: "thewerks", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/thewerks.json',
                order: "werks"),
  new BandMaker(bandName: "Yonder Mountain String Band", search: "yondermountainstringband", 
                selected: false, colorSelected: Colors.red, 
                colorUnselected: Colors.white, iconSelected: Icons.favorite, 
                iconUnselected: Icons.favorite, 
                jsonFile: 'assets/data/yondermountainstringband.json',
                order: "Yonder Mountain String Band"),
];

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
var gratefulShred = false; //
var garciaPeoples = false; //
var hotButteredRum = false; //
var jeffersonStarship = false; //
var gracePotter = false; //
var travelinMcCourys = false; //
var bobWeir = false; //
var theWerks = false; //


var countSelected = 0;
class _CheckBandsState extends State<CheckBands> {

  double _itemHeight = 50.0;

  Widget _buildBandList(BuildContext context, BandMaker band, int index) {

    return Container(
      height: _itemHeight,
      child: Material(
        color: band.selected ? Colors.blue[300] : Colors.white,
        child: InkWell(
          splashColor: Colors.blue[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10, width: 10),  
              Icon(
                band.selected ? band.iconSelected : band.iconUnselected,
                color: band.selected ? band.colorSelected : band.colorUnselected,
              ),
              SizedBox(height: 10, width: 10),
              Text(
                band.bandName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: band.selected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          onTap: () {
            if (!band.selected) {
              setState(() {
                band.selected = !band.selected;
                countSelected++;            
              });
              print(countSelected);
            }
            else {
              setState(() {
                band.selected = !band.selected;
                countSelected--;
              });
              print(countSelected);
            }
          },
        ),
      ),
    );
    
  }

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
                for (int i = 0; i < myBands.length; i++) {
                  setState(() {
                    myBands[i].selected = false;
                  });
                }
                setState(() {
                  
                  countSelected = 0;
                });
              }
              else if (countSelected == 0) {
                for (int i = 0; i < myBands.length; i++) {
                  setState(() {
                    myBands[i].selected = true;
                  });
                }
                setState(() {
                  
                  countSelected = myBands.length;
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
            generateRandomTuneList();
            songList.clear();
            songInfo.clear();
            poweredBy.clear();
            songURL.clear();
            songArtist.clear();
            songTitle.clear();
            songAlbumDate.clear();
            songSource.clear();
            queue.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                MyHomePage()));
          }
        },
      ),
      body: ListView.builder(
        itemCount: myBands.length,
        itemExtent: _itemHeight,
        itemBuilder: (context, index) {
          return _buildBandList(context, myBands[index], index);
        }
      ),
      
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
final count = 5;
var tracker = 0;
class _MyHomePageState extends State<MyHomePage> {

    Future<void> _retrieveLocalSongInfo() async {
      for (int i = 0; i < myBands.length; i++) {
        if (myBands[i].selected) {
          final json = DefaultAssetBundle
                .of(context)
                .loadString(myBands[i].jsonFile);
          final data = JsonDecoder().convert(await json);
          if (data is! Map) {
            throw ('Data retrieved from API is not a Map');
          }
          var _bandName = myBands[i].bandName;
          var _song;
          data.keys.forEach((key) {
            final List<Show> songStuff = 
              data[key].map<Show>((dynamic data) => Show.fromJson(data)).toList();
            var _songUrl = SongUrl(
              showName: key,
              files: songStuff,
            );
            for (var counter = 0; counter < songStuff.length; counter++) {
              if (songStuff[counter].format == "VBR MP3") {
                if (myBands[i].bandName == "Phish") {
                  songURL.add("${_songUrl.files[counter].name}");
                  songArtist.add("${_songUrl.files[counter].creator}");
                  songTitle.add("${_songUrl.files[counter].title}");
                  songAlbumDate.add("${_songUrl.files[counter].album}");
                  songSource.add("Powered by phish.in");
                }
                else {
                  songURL.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
                  
                  if (_songUrl.files[counter].creator == null) {
                    songArtist.add("$_bandName");
                  }
                  else {
                    songArtist.add("${_songUrl.files[counter].creator}");
                  }
                  if (_songUrl.files[counter].title == null) {
                    songTitle.add("${_songUrl.files[counter].name}");
                  }
                  else {
                    songTitle.add("${_songUrl.files[counter].title}");
                  }
                  if (_songUrl.files[counter].album == null) {
                    songAlbumDate.add("${_songUrl.showName}");
                  }
                  else {
                    songAlbumDate.add("${_songUrl.files[counter].album}");
                  }
                  
                  songSource.add("Powered by archive.org");
                }
                //songList.add("https://archive.org/download/${_songUrl.showName}/${_songUrl.files[counter].name}");
                //songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
              }
            }
          });
          
        }
        
      }

    
  }
 
  @override
  Widget build(BuildContext context) {

    _retrieveLocalSongInfo();
    
    
    return Scaffold(
      
      body: Center(
        
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Material(
            color: Colors.grey[100],
            child: InkWell(
              splashColor: Colors.grey[400],
              child: Center(
                child: Text(
                    "${tuneList[tuneInt].translation}\n(${tuneList[tuneInt].language})",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 38.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                
              ),
              onTap: () async {
                if (songURL[0] == null) {
                  _retrieveLocalSongInfo();
                  
                  
                }
                if (tracker != count) {

                }
                
                
                Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                AudioServiceWidget(child: SongUI())));
              },
            ),
          ),
   
          
        ),
      ),

    );
  }
}

class Tunes {
  String translation;
  String language;

  Tunes({@required String translation, @required String language}) {
    this.translation = translation;
    this.language = language;
  }
}

int tuneInt;

int generateRandomTuneList() {
  var rngtl = new Random();
  var temptl = rngtl.nextInt(tuneList.length);
  tuneInt = temptl;
  return temptl;
}

List<Tunes> tuneList = [
  new Tunes(translation: "Listen to some tunes?", language: "English"),
  new Tunes(translation: "¿Escuchar algunas canciones?", language: "Spanish"),
  new Tunes(translation: "Ecouter de la musique?", language: "French"),
  new Tunes(translation: "Ouvir algumas músicas?", language: "Portuguese"),
  new Tunes(translation: "Ascoltate qualche brano?", language: "Italian"),
  new Tunes(translation: "Luister je naar wat deuntjes?", language: "Dutch"),
  new Tunes(translation: "Słucham? Jakieś piosenki?", language: "Polish"),
  new Tunes(translation: "Слушаешь какие-нибудь мелодии?", language: "Russian"),
  new Tunes(translation: "曲を聴いてみないか？", language: "Japanese"),
  new Tunes(translation: "听点曲子？", language: "Chinese (simplified)"),
  new Tunes(translation: "Hören Sie sich einige Melodien an?", language: "German"),
];
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'package:web_scraper/web_scraper.dart';

import 'songs_update_backroundplay.dart';
import 'song_url.dart';
import 'song_decode.dart';

import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'package:web_scraper/web_scraper.dart';

import 'dart:async';
import 'dart:io';
import 'package:audio_service/audio_service.dart';

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

void main() {
  runApp(MyApp());
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
      home: AudioServiceWidget(child: MyHomePage()),
      
        
      
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

class _MyHomePageState extends State<MyHomePage> {

    Future<void> _retrieveLocalSongInfo() async {
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/output1.json');
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
          songList.add("${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
        }
        
      }

      
     
    });

    final json2 = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/soundboards.json');
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
          songList.add("${_songUrl.showName}/${_songUrl.files[counter].name}");
          songInfo.add("${_songUrl.files[counter].title}\n${_songUrl.files[counter].creator}\n${_songUrl.files[counter].album}\n${_songUrl.files[counter].name}");
        }
        
      }

      
     
    });
    

    print(songList.length);
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
              onTap: () {
                if (songList[0] == null) {
                  _retrieveLocalSongInfo();
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


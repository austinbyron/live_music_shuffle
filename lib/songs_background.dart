import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:meta/meta.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rxdart/rxdart.dart';

import 'main.dart';
import 'song_decode.dart';
import 'song_url.dart';
//import 'mediaitemmaker.dart';


List<String> songList = List<String>();
List<String> songInfo = List<String>();
List<String> poweredBy = List<String>();

List<MediaItem> queue = new List();

class PlayerUI extends StatefulWidget {

  PlayerUI();

  @override
  _PlayerUI createState() => _PlayerUI();
}

class _PlayerUI extends State<PlayerUI> {

  _PlayerUI();

  @override
  void initState() {

    super.initState();
    AudioService.start(
      backgroundTaskEntrypoint: myBackgroundTaskEntrypoint,
      
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("test page"),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: AudioService.queueStream,
            builder: (context, snapshot) {
              
            },
          )
        ],
      ),
    );
  }
}

var lengthOfList = songList.length;
var tempInt;

String getUrl() {
    
  //print("songURL.length = ${songURL.length}");
  var rng = new Random();
  var temp = rng.nextInt(songURL.length); //size of songList
  tempInt = temp;
  //number = temp;
  //addToQueue();
  queue.add(new MediaItem(id: songURL[temp], title: songTitle[temp], album: songAlbumDate[temp]));
  for (int i = 0; i < queue.length; i++)
    print("${queue[i].id}");
  
  return songURL[temp];
}

void myBackgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => BackgroundAudioService());
}

class BackgroundAudioService extends BackgroundAudioTask {

  final AudioPlayer _audioPlayer = new AudioPlayer();

  Future<void> newSong() async {
    var temporaryURL = getUrl();
    
    //await widget.player.setUrl(temporaryURL);
    var rng = new Random();
    var temp = rng.nextInt(songURL.length); //size of songList
    //tempInt = temp;
    _audioPlayer.setUrl(songList[temp]);
    //widget.player.play();
    //var tempString = songTitle[tempInt] + "\n" + songArtist[tempInt] + "\n" + songAlbumDate[tempInt] + "\n"; 

    //return tempString;
    
  }

  @override
  onStart() {
    throw "stuff";
  }

  @override
  onStop() {
    throw "stuff";
  }


}

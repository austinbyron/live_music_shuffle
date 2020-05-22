import 'package:audio_service/audio_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'songs_update_backroundplay.dart';
import 'song_decode.dart';



class MediaItemMaker {
  var songName;

  //if queue has less than 5 songs
  //add new media item to queue
  //IDEA:
  ///
  ///
  ///keep multiple concurrent lists running of each:
  ///List<String> songURL
  ///List<String> artist
  ///List<String> songTitle
  ///List<String> date/album
  ///List<String> source (archive.org/phish.in)
  ///
  ///
  ///already have 3 concurrent lists and will cut down on size so should be possible
  ///
}
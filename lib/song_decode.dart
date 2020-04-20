import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'song_url.dart';

import 'dart:async';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/constants.dart';

class Show {

  final name;
  //final source;
  final creator;
  final title;
  //final track;
  final album;
  //final bitrate;
  //final length;
  final format;
  //final original;
  //final mtime;
  //final size;
  //final md5;
  //final crc32;
  //final sha1;
  //final height;
  //final width;

  const Show({
    this.name,
    //this.source,
    this.creator, 
    this.title,
    //this.track, 
    this.album,
    //this.bitrate, 
    //this.length, 
    this.format,
    //this.original, 
    //this.mtime, 
    //this.size, 
    //this.md5, 
    //this.crc32,
    //this.sha1, 
    //this.height, 
    //this.width})

    })  : assert(name != null);

    
  
  Show.fromJson(Map jsonMap) 
    : 
      name = jsonMap['name'] != null ? jsonMap['name'] : null,
      title = jsonMap['title'] != null ? jsonMap['title'] : null,
      format = jsonMap['format'] != null ? jsonMap['format'] : null,
      creator = jsonMap['creator'] != null ? jsonMap['creator'] : null,
      album = jsonMap['album'] != null ? jsonMap['album'] : null;
  
}

class SongInfo extends StatefulWidget {

  SongInfo();
  @override
  _songInfo createState() => _songInfo();

}

class _songInfo extends State<SongInfo> {

  
  
  
  
  @override
  Widget build(BuildContext context) {
    //_retrieveLocalSongInfo();

    
    // TODO: implement build
    return Container();
  }
}
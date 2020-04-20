
import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'package:web_scraper/web_scraper.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'dart:async';
import 'dart:io';

//import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
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


//const testurl = 'https://archive.org/details/gd72-05-03.sbd.masse.142.sbeok.shnf/gd72-5-3d2t05.shn';

typedef void OnError(Exception exception);

List<String> songList = List<String>();
List<String> songInfo = List<String>();

List<MusicPlayer> musicPlayerList = List<MusicPlayer>();
List<String> favList = List<String>();
List<String> favInfo = List<String>();
int countMusicPlayer = 0;

var tempInt;

MediaControl playControl = MediaControl(
  androidIcon: 'drawable/ic_action_play_arrow',
  label: 'Play',
  action: MediaAction.play,
);
MediaControl pauseControl = MediaControl(
  androidIcon: 'drawable/ic_action_pause',
  label: 'Pause',
  action: MediaAction.pause,
);
MediaControl skipToNextControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_next',
  label: 'Next',
  action: MediaAction.skipToNext,
);
MediaControl skipToPreviousControl = MediaControl(
  androidIcon: 'drawable/ic_action_skip_previous',
  label: 'Previous',
  action: MediaAction.skipToPrevious,
);
MediaControl stopControl = MediaControl(
  androidIcon: 'drawable/ic_action_stop',
  label: 'Stop',
  action: MediaAction.stop,
);


String _getUrl() {
    //_retrieveLocalSongInfo();
  var rng = new Random();
  var temp = rng.nextInt(125600); //size of songList
  tempInt = temp;
  return "https://archive.org/download/${songList[temp]}";
}

class SongUI extends StatefulWidget {

  const SongUI();

  @override
  _songUI createState() => _songUI();
}

class _songUI extends State<SongUI> {

  //AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  String localFilePath;
 

  @override
  Widget build(BuildContext context) {
    
    //_retrieveLocalSongInfo();
    //setState(() {
      //_retrieveLocalSongInfo();
    //});
    String _tempUrl = _getUrl();
    //musicPlayerList.add(MusicPlayer(url: _tempUrl));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        //backgroundColor: Colors.grey[500],
        title: Text(
          "Find some new music",
          style: TextStyle(
            fontWeight: FontWeight.w300
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Expanded(
              //height: MediaQuery.of(context).size.height,
              //width: MediaQuery.of(context).size.height,
          
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Material(
                  
                  color: Colors.grey[200],
                  child: Column(
                     //mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       AudioServiceWidget(child: MusicPlayer(url: _tempUrl)),
                       //Text(
                         //songInfo[tempInt],
                         //textAlign: TextAlign.center,
                        //),
                     ],
                   
                    
                  ),
                  
                ),
              ),
            ),
          ),

          
          

          
        ],
      ),
    );
  }
}




enum PlayerState { stopped, playing, paused }
enum PlayingRouteState { speakers, earpiece }

class MusicPlayer extends StatefulWidget {
  String url;
  //final PlayerMode mode;

  MusicPlayer(
    {Key key, @required this.url})
    : super(key: key);

  @override
  State<StatefulWidget> createState() {
    //url = _getUrl();
    return _musicPlayerState(url);
  }
  
}

class _musicPlayerState extends State<MusicPlayer> {
  String url;
  //PlayerMode mode;
  final _volumeSubject = BehaviorSubject.seeded(1.0);
  final _speedSubject = BehaviorSubject.seeded(1.0);
  AudioPlayer _player;
  //AudioPlayerState _audioPlayerState;
  Duration _duration;
  Duration _position;

  


//var temp123 = "https://archive.org/download/gd95-07-06.sbd.9119.sbeok.shnf/gd95-07-06d2t03.mp3";
  
  _musicPlayerState(this.url);

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    var temp = _getUrl();
    _player.setUrl(temp);
    
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    bool hasSkipped = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        
        
        
        StreamBuilder<Duration>(
          stream: _player.durationStream,
          builder: (context, snapshot) {
            final duration = snapshot.data ?? Duration.zero;
            //final fullState = snapshot.data;
            
            return StreamBuilder<Duration>(
              stream: _player.getPositionStream(),
              builder: (context, snapshot) {
                var position = snapshot.data ?? Duration.zero;
                if (position > duration) {
                  position = duration;
                  newSong();
                  
                  
                    
                }
                
                return SeekBar(
                  duration: duration,
                  position: position,
                  onChangeEnd: (newPosition) {
                    _player.seek(newPosition);
                  },
                );
              },
            );
          }
        ),
        SizedBox(width: 10, height: 10),
        StreamBuilder<FullAudioPlaybackState> (
          stream: _player.fullPlaybackStateStream,
          builder: (context, snapshot) {
            final fullState = snapshot.data;
            var state = fullState?.state;
            final buffering = fullState?.buffering;
            
            
            
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state == AudioPlaybackState.connecting || buffering == true)
                  Container(
                    margin: EdgeInsets.all(8.0),
                    width: 64.0,
                    height: 64.0,
                    child: CircularProgressIndicator(),
                  )
                else if (state == AudioPlaybackState.playing) 
                  IconButton(
                    icon: Icon(Icons.pause),
                    iconSize: 64.0,
                    onPressed: _player.pause,
                  )
                else 
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    iconSize: 64.0,
                    onPressed: _player.play,
                  ),
                IconButton(
                  icon: Icon(Icons.stop),
                  iconSize: 64.0,
                  onPressed: state == AudioPlaybackState.stopped ||
                              state == AudioPlaybackState.none
                              ? null
                              : _player.stop,
                            
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  iconSize: 64.0,
                  onPressed: () {
                    setState(() {
                      //initState();
                      state = AudioPlaybackState.playing;
                      hasSkipped = true;
                    });
                    newSong();
                    
                  }
                ),
              ],
            );
          },
        ),
        
        Text("\nVolume"),
        StreamBuilder<double>(
          stream: _volumeSubject.stream,
          builder: (context, snapshot) => Slider(
            divisions: 20,
            min: 0.0,
            max: 2.0,
            value: snapshot.data ?? 1.0,
            onChanged: (value) {
              _volumeSubject.add(value);
              _player.setVolume(value);
            },
          ),
        ),
        Text("Speed"),
        StreamBuilder<double>(
          stream: _speedSubject.stream,
          builder: (context, snapshot) => Slider(
            divisions: 10,
            min: 0.5,
            max: 1.5,
            value: snapshot.data ?? 1.0,
            onChanged: (value) {
              _speedSubject.add(value);
              _player.setSpeed(value);
            },
          ),
        ),
        SizedBox(width: 10, height: 10),
        Text("\nPowered by Archive.org\nInspired by Relisten.net"),
      ],
    );
  }

  String newSong() {
    var temporaryURL = _getUrl();
    _player.setUrl(temporaryURL);
    while (_player.buffering == true) {
      //do nothing
    }
    
    playit();
    return songInfo[tempInt];
  }

  Future<void> playit() async {
    await _player.play();
  }
  
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;


  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _seekBarState createState() => _seekBarState();
}

class _seekBarState extends State<SeekBar> {
  double _dragValue;

  get _durationText => widget.duration?.toString()?.split('.')?.first ?? '';
  get _positionText => widget.position?.toString()?.split('.')?.first ?? '';

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height *7/24,
            width: MediaQuery.of(context).size.width * 7/8,
            child: Center(
              child: Text(
                "\n${songInfo[tempInt] ??''}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0, 
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
          ),

          
          
        ),
        //Text("Track position"),
        Slider(
          min: 0.0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
          onChanged: (value) {
            setState(() {
              _dragValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) {
            _dragValue = null;
            if (widget.onChangeEnd != null) {
              widget.onChangeEnd(Duration(milliseconds: value.round()));
            }
          },
        ),
        Text(
              widget.position != null ? '${_positionText ??''} / ${_durationText ?? ''}'
                                : widget.duration != null ? _durationText : '',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
        ),
      ],
    ),
    );
  }
}
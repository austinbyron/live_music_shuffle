import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

import 'package:web_scraper/web_scraper.dart';

import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:just_audio/just_audio.dart';
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
String _getUrl() {
    //_retrieveLocalSongInfo();
  var rng = new Random();
  var temp = rng.nextInt(284500);
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

  
  
  //Future<void> _retrieveLocalSongInfo() async {
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    //final json = DefaultAssetBundle
      //  .of(context)
        //.loadString('assets/data/manifestWorkAnotherStepFixing.json');
    //final data = JsonDecoder().convert(await json);
    //if (data is! Map) {
      //throw ('Data retrieved from API is not a Map');
    //}

    //Show stuff = Show();
    //var categoryIndex = 0;
    //data.keys.forEach((key) {
      //final List<Show> songStuff =
        //  data[key].map<Show>((dynamic data) => Show.fromJson(data)).toList();
      //var _songUrl = SongUrl(
        //showName: key,
        //files: songStuff,
        
      //);
      //for (var counter = 0; counter < songStuff.length; counter++) {
        //if (songStuff[counter].format == "Flac" || songStuff[counter].format == "VBR MP3") {
          //songList.add("${_songUrl.showName}/${_songUrl.files[counter].name}");
       // }
        
      //}
     
    //});

    //print(songList.length);
  //}
  //int _generateRandom() {
    //var rng = new Random();
    //var temp = rng.nextInt(284500);
    //return temp; 
  //}

  

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
                       MusicPlayer(url: _tempUrl),
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
  final PlayerMode mode;

  MusicPlayer(
    {Key key, @required this.url, this.mode = PlayerMode.MEDIA_PLAYER})
    : super(key: key);

  @override
  State<StatefulWidget> createState() {
    //url = _getUrl();
    return _musicPlayerState(url, mode);
  }
  
}

class _musicPlayerState extends State<MusicPlayer> {
  String url;
  PlayerMode mode;

  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState;
  Duration _duration;
  Duration _position;

  PlayerState _playerState = PlayerState.stopped;
  PlayingRouteState _playingRouteState = PlayingRouteState.speakers;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  get _isPlayingThroughEarpiece => _playingRouteState == PlayingRouteState.earpiece;

  _musicPlayerState(this.url, this.mode);

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              key: Key('play_button'),
              icon: Icon(Icons.play_arrow),
              color: Colors.cyan,
              iconSize: 64.0,
              onPressed: _isPlaying ? null : () => _play(),
            ),
            IconButton(
              key: Key('skip_button'),
              icon: Icon(Icons.skip_next), 
              onPressed: () => _onComplete(),
              iconSize: 64.0,
              color: Colors.cyan,
            ),
            //IconButton(
              //key: Key('pause_button'),
              //icon: Icon(Icons.pause), 
              //onPressed: _isPlaying ? () => _pause() : null,
              //iconSize: 64.0,
              //color: Colors.cyan,
            //),
            //IconButton(
              //key: Key('stop_button'),
              //onPressed: _isPlaying || _isPaused ? () => _stop() : null,
              //iconSize: 64.0,
              //icon: Icon(Icons.stop),
              //color: Colors.cyan,
            //),
            //IconButton(
              //onPressed: _earpieceOrSpeakersToggle,
              //iconSize: 64.0,
              //icon: _isPlayingThroughEarpiece
                //  ? Icon(Icons.volume_up)
                 // : Icon(Icons.hearing),
              //color: Colors.cyan,
            //),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  Slider(
                    onChanged: (v) {
                      final Position = v * _duration.inMilliseconds;
                      _audioPlayer.seek(Duration(milliseconds: Position.round()));
                    },
                    value: (_position != null &&
                            _duration != null &&
                            _position.inMilliseconds > 0 &&
                            _position.inMilliseconds < _duration.inMilliseconds)
                          ? _position.inMilliseconds / _duration.inMilliseconds
                          : 0.0,
                  ),
                ],
              ),
            ),
            Text(
              _position != null ? '${_positionText ??''} / ${_durationText ?? ''}'
                                : _duration != null ? _durationText : '',
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '${songInfo[tempInt]}', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
            ),
        SizedBox(height: 10, width: 10),
          Center(
            child: Container(
              height: 180.0,
              width: 400.0 < MediaQuery.of(context).size.width
                     ? 400.0 : MediaQuery.of(context).size.width,
          
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Material(
            
                  color: Colors.blue,
                  child: InkWell(
                    splashColor: Colors.red,
                    child: SizedBox(

                      width: 56.0,
                      height: 56.0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, 
                          children: [
                            Text(
                              "Next song",
                              style: TextStyle(
                                fontSize: 50.0, 
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            //SizedBox(width: 8, height: 8),
                            //Icon(
                              //Icons.skip_next,
                              //color: Colors.white,
                              //size: 50.0,
                            //),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _onComplete();
                      });
                    },
              
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10, width: 10),
          Text(
            "Powered by Archive.org\nInspired by Relisten.net",
            textAlign: TextAlign.center,
          ),
            
          ],
        ),
        
      ],
    );
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: mode);

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);

      if (Theme.of(context).platform == TargetPlatform.iOS) {
        _audioPlayer.startHeadlessService();

        _audioPlayer.setNotification(
          title: 'App Name',
          artist: 'Artist or blank',
          albumTitle: 'Name or blank',
          imageUrl: 'url or blank',
          forwardSkipInterval: const Duration(seconds: 30),
          backwardSkipInterval: const Duration(seconds: 30),
          duration: duration,
          elapsedTime: Duration(seconds: 0)
        );
      }
    });

    _positionSubscription = _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
      _position = p;
    }));

    _playerCompleteSubscription = _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      setState(() {
        _position = _duration;
      });
    });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        _audioPlayerState = state;
      });
    });

    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() => _audioPlayerState = state);
    });

    _playingRouteState = PlayingRouteState.speakers;
  }

  Future<int> _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
          ? _position
          : null;
    final result = await _audioPlayer.play(url, position: playPosition);
    if (result == 1) setState(() => _playerState = PlayerState.playing);


    _audioPlayer.setPlaybackRate(playbackRate: 1.0);
    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  Future<int> _earpieceOrSpeakersToggle() async {
    final result = await _audioPlayer.earpieceOrSpeakersToggle();
    if (result == 1) 
      setState(() => _playingRouteState =
        _playingRouteState == PlayingRouteState.speakers
            ? PlayingRouteState.earpiece
            : PlayingRouteState.speakers);
    return result;
  }
  Future<int> _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration();
      });
    }
    return result;
  }

  void _onComplete() async {
    //setState(() => _playerState = PlayerState.playing);
    //_audioPlayer.dispose();
    //_audioPlayer = new AudioPlayer();
    //int result = await _audioPlayer.release();
    //if (result == 1) {
      setState(() {
      //dispose();
      
      //_audioPlayer = new AudioPlayer();
      //initState();
      //_audioPlayer.dispose();
      //_audioPlayer = null;
      //_audioPlayerState = null;
      //_playerState = null;
      //_playingRouteState = null;

      
      //musicPlayerList.removeAt(countMusicPlayer);
      var temp = _getUrl();
      //musicPlayerList.add(MusicPlayer(url: temp));
      //_playerState = null;
      _position = Duration();
      //_initAudioPlayer();
      //var temp = _getUrl();
      //_audioPlayer.setUrl(temp);
      _audioPlayer.play(temp);
      _playerState = PlayerState.playing;
      //url = _getUrl();
      //initState();

    });
    //}
    
  }
}
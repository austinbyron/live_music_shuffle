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
import 'mediaitemmaker.dart';

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

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

void myBackgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => BackgroundAudioService());
}

class BackgroundAudioService extends BackgroundAudioTask {

  final AudioPlayer _audioPlayer = new AudioPlayer();

  @override
  onStart() {
    throw "stuff";
  }

  @override
  onStop() {
    throw "stuff";
  }


}

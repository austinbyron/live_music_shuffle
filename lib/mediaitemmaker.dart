import 'package:audio_service/audio_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'songs_update_backroundplay.dart';
import 'song_decode.dart';

import 'dart:math';
import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

List<MediaItem> queue = new List();
int queueIndex = -1;

void addToQueue() {
  
    //might need to change if im not gonna pop previously played songs
    //from the queue unless this is what i use to initialize the queue
    //maybe seperate function to add to queue when the index is almost 5
    //and or when index is at 4 or 5 away from the end of the list
  while (queue.length < 5) {
    var rng = new Random();
    var temp = rng.nextInt(songURL.length);
    MediaItem nMI = new MediaItem(
      id: songURL[temp],
      album: songAlbumDate[temp],
      title: songTitle[temp],
      artist: songArtist[temp],
      displaySubtitle: songSource[temp],
    );
    queue.add(nMI);
  }
}

/*

class MainScreen extends StatelessWidget {
  /// Tracks the position while the user drags the seek bar.
  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Service Demo'),
      ),
      body: Center(
        child: StreamBuilder<ScreenState>(
          stream: _screenStateStream,
          builder: (context, snapshot) {
            final screenState = snapshot.data;
            final queue = screenState?.queue;
            final mediaItem = screenState?.mediaItem;
            final state = screenState?.playbackState;
            final basicState = state?.basicState ?? BasicPlaybackState.none;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (queue != null && queue.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.skip_previous),
                        iconSize: 64.0,
                        onPressed: mediaItem == queue.first
                            ? null
                            : AudioService.skipToPrevious,
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next),
                        iconSize: 64.0,
                        onPressed: mediaItem == queue.last
                            ? null
                            : AudioService.skipToNext,
                      ),
                    ],
                  ),
                if (mediaItem?.title != null) Text(mediaItem.title),
                if (basicState == BasicPlaybackState.none) ...[
                  audioPlayerButton(),
                  //textToSpeechButton(),
                ] else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (basicState == BasicPlaybackState.playing)
                        pauseButton()
                      else if (basicState == BasicPlaybackState.paused)
                        playButton()
                      else if (basicState == BasicPlaybackState.buffering ||
                          basicState == BasicPlaybackState.skippingToNext ||
                          basicState == BasicPlaybackState.skippingToPrevious)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 64.0,
                            height: 64.0,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      stopButton(),
                    ],
                  ),
                if (basicState != BasicPlaybackState.none &&
                    basicState != BasicPlaybackState.stopped) ...[
                  positionIndicator(mediaItem, state),
                  Text("State: " +
                      "$basicState".replaceAll(RegExp(r'^.*\.'), '')),
                  StreamBuilder(
                    stream: AudioService.customEventStream,
                    builder: (context, snapshot) {
                      return Text("custom event: ${snapshot.data}");
                    },
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  /// Encapsulate all the different data we're interested in into a single
  /// stream so we don't have to nest StreamBuilders.
  Stream<ScreenState> get _screenStateStream =>
      Rx.combineLatest3<List<MediaItem>, MediaItem, PlaybackState, ScreenState>(
          AudioService.queueStream,
          AudioService.currentMediaItemStream,
          AudioService.playbackStateStream,
          (queue, mediaItem, playbackState) =>
              ScreenState(queue, mediaItem, playbackState));

  RaisedButton audioPlayerButton() => startButton(
        'AudioPlayer',
        () {
          AudioService.start(
            backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
            androidNotificationChannelName: 'Audio Service Demo',
            notificationColor: 0xFF2196f3,
            androidNotificationIcon: 'mipmap/ic_launcher',
            enableQueue: true,
          );
        },
      );

  RaisedButton startButton(String label, VoidCallback onPressed) =>
      RaisedButton(
        child: Text(label),
        onPressed: onPressed,
      );

  IconButton playButton() => IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: AudioService.play,
      );

  IconButton pauseButton() => IconButton(
        icon: Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: AudioService.pause,
      );

  IconButton stopButton() => IconButton(
        icon: Icon(Icons.stop),
        iconSize: 64.0,
        onPressed: AudioService.stop,
      );

  Widget positionIndicator(MediaItem mediaItem, PlaybackState state) {
    double seekPos;
    return StreamBuilder(
      stream: Rx.combineLatest2<double, double, double>(
          _dragPositionSubject.stream,
          Stream.periodic(Duration(milliseconds: 200)),
          (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
        double position = snapshot.data ?? state.currentPosition.toDouble();
        double duration = mediaItem?.duration?.toDouble();
        return Column(
          children: [
            if (duration != null)
              Slider(
                min: 0.0,
                max: duration,
                value: seekPos ?? max(0.0, min(position, duration)),
                onChanged: (value) {
                  _dragPositionSubject.add(value);
                },
                onChangeEnd: (value) {
                  AudioService.seekTo(value.toInt());
                  // Due to a delay in platform channel communication, there is
                  // a brief moment after releasing the Slider thumb before the
                  // new position is broadcast from the platform side. This
                  // hack is to hold onto seekPos until the next state update
                  // comes through.
                  // TODO: Improve this code.
                  seekPos = value;
                  _dragPositionSubject.add(null);
                },
              ),
            Text("${(state.currentPosition / 1000).toStringAsFixed(3)}"),
          ],
        );
      },
    );
  }
}

*/

//class AudioPlayerTask extends BackgroundAudioTask {



 

  //@override
  //Future<void> onStart() async {
    //var playerStateSubscription = _audioPlayer.playbackStateStream
      //  .where((state) => state == AudioPlaybackState.completed)
       // .listen((state) {
      //_handlePlaybackCompleted();
    //});
    //var eventSubscription = _audioPlayer.playbackEventStream.listen((event) {
      //final state = _eventToBasicState(event);
      //if (state != BasicPlaybackState.stopped) {
        //_setState(
        //  state: state,
      //    position: event.position.inMilliseconds,
        ///);
      //}
    //});

    //AudioServiceBackground.setQueue(queue);
    //await onSkipToNext();
    //await _completer.future;
    //playerStateSubscription.cancel();
    //eventSubscription.cancel();
  //}

  //@override
  //Future<void> stop() => _stop();

  //@override
  //Future<void> onSkipToNext() => _skip(1);

  //@override
  //Future<void> onSkipToPrevious() => _skip(-1);
  
  
  

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
  ///
  ///checked above, it works
  ///
  ///now set up a queue such that everytime a song finishes and/or is skipped
  ///we go to the next song in the queue, and a song is subsequently added 
  ///said queue
  ///
//}

/*

class AudioPlayerTask extends BackgroundAudioTask {

  AudioPlayer _audioPlayer = new AudioPlayer();
  Completer _completer = Completer();
  BasicPlaybackState _skipState;
  bool _playing;

  bool get hasNext => queueIndex + 1 < queue.length;

  bool get hasPrevious => queueIndex > 0;

  MediaItem get mediaItem => queue[queueIndex];

  BasicPlaybackState _eventToBasicState(AudioPlaybackEvent event) {
    if (event.buffering) {
      return BasicPlaybackState.buffering;
    } else {
      switch (event.state) {
        case AudioPlaybackState.none:
          return BasicPlaybackState.none;
        case AudioPlaybackState.stopped:
          return BasicPlaybackState.stopped;
        case AudioPlaybackState.paused:
          return BasicPlaybackState.paused;
        case AudioPlaybackState.playing:
          return BasicPlaybackState.playing;
        case AudioPlaybackState.connecting:
          return _skipState ?? BasicPlaybackState.connecting;
        case AudioPlaybackState.completed:
          return BasicPlaybackState.stopped;
        default:
          throw Exception("Illegal state");
      }
    }
  }

  @override
  Future<void> onStart() async {
    var playerStateSubscription = _audioPlayer.playbackStateStream
        .where((state) => state == AudioPlaybackState.completed)
        .listen((state) {
      _handlePlaybackCompleted();
    });
    var eventSubscription = _audioPlayer.playbackEventStream.listen((event) {
      final state = _eventToBasicState(event);
      if (state != BasicPlaybackState.stopped) {
        _setState(
          state: state,
          position: event.position.inMilliseconds,
        );
      }
    });

    AudioServiceBackground.setQueue(queue);
    await onSkipToNext();
    await _completer.future;
    playerStateSubscription.cancel();
    eventSubscription.cancel();
  }

  void _handlePlaybackCompleted() {
    if (hasNext) {
      onSkipToNext();
    } else {
      onStop();
    }
  }

  void playPause() {
    if (AudioServiceBackground.state.basicState == BasicPlaybackState.playing)
      onPause();
    else
      onPlay();
  }

  @override
  Future<void> onSkipToNext() => _skip(1);

  @override
  Future<void> onSkipToPrevious() => _skip(-1);

  Future<void> _skip(int offset) async {
    final newPos = queueIndex + offset;
    if (!(newPos >= 0 && newPos < queue.length)) return;
    if (_playing == null) {
      // First time, we want to start playing
      _playing = true;
    } else if (_playing) {
      // Stop current item
      await _audioPlayer.stop();
    }
    // Load next item
    queueIndex = newPos;
    AudioServiceBackground.setMediaItem(mediaItem);
    _skipState = offset > 0
        ? BasicPlaybackState.skippingToNext
        : BasicPlaybackState.skippingToPrevious;
    await _audioPlayer.setUrl(mediaItem.id);
    _skipState = null;
    // Resume playback if we were playing
    if (_playing) {
      onPlay();
    } else {
      _setState(state: BasicPlaybackState.paused);
    }
  }

  @override
  void onPlay() {
    if (_skipState == null) {
      _playing = true;
      _audioPlayer.play();
      //AudioServiceBackground.sendCustomEvent('just played');
    }
  }

  @override
  void onPause() {
    if (_skipState == null) {
      _playing = false;
      _audioPlayer.pause();
      //AudioServiceBackground.sendCustomEvent('just paused');
    }
  }

  @override
  void onSeekTo(int position) {
    _audioPlayer.seek(Duration(milliseconds: position));
  }

  @override
  void onClick(MediaButton button) {
    playPause();
  }

  @override
  Future<void> onStop() async {
    await _audioPlayer.stop();
    await _audioPlayer.dispose();
    _setState(state: BasicPlaybackState.stopped);
    _completer.complete();
  }

  void _setState({@required BasicPlaybackState state, int position}) {
    if (position == null) {
      position = _audioPlayer.playbackEvent.position.inMilliseconds;
    }
    AudioServiceBackground.setState(
      controls: getControls(state),
      systemActions: [MediaAction.seekTo],
      basicState: state,
      position: position,
    );
  }

  List<MediaControl> getControls(BasicPlaybackState state) {
    if (_playing) {
      return [
        skipToPreviousControl,
        pauseControl,
        stopControl,
        skipToNextControl
      ];
    } else {
      return [
        skipToPreviousControl,
        playControl,
        stopControl,
        skipToNextControl
      ];
    }
  }
}

class ScreenState {
  final List<MediaItem> queue;
  final MediaItem mediaItem;
  final PlaybackState playbackState;

  ScreenState(this.queue, this.mediaItem, this.playbackState);
}

void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}
*/
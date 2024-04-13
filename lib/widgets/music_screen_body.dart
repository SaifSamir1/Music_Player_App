import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_player/manger/music__cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../generated/assets.dart';
import '../models/seek_bar_data_model.dart';
import 'music_player.dart';
import 'music_screen_background.dart';

class MusicScreenBody extends StatefulWidget {
  const MusicScreenBody({super.key,
    required this.musicFile,
    required this.allMusicFiles,
    required this.audioPlayer});

  final SongModel musicFile;
  final List<SongModel> allMusicFiles;
  final AudioPlayer audioPlayer;

  @override
  State<MusicScreenBody> createState() => _MusicScreenBodyState();
}

class _MusicScreenBodyState extends State<MusicScreenBody> {
  List<AudioSource> audioSources = [];

  @override
  void initState() {
    initilaizationAudioSourceObject();
    playSong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicCubit(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.imagesMusicScreen,
            fit: BoxFit.cover,
          ),
          BackGround(
            musicFile: widget.allMusicFiles,
            audioPlayer: widget.audioPlayer,
          ),
          MusicPlayerTools(
            seekBarDataStream: seekBarDataStream,
            audioPlayer: widget.audioPlayer,
          )
        ],
      ),
    );
  }

  void initilaizationAudioSourceObject() {
    audioSources = widget.allMusicFiles.map((musicFile) {
      final filePath = musicFile.uri;
      return AudioSource.uri(
        Uri.parse(filePath!),
        tag: MediaItem(
          id: "${widget.musicFile.id}",
          album: "${widget.musicFile.album}",
          title: widget.musicFile.displayNameWOExt,
          artUri: Uri.parse('https://example.com/albumart.jpg'),
        ),
      );
    }).toList();
  }

  void playSong() {
    DefaultShuffleOrder defaultShuffleOrder = DefaultShuffleOrder();
    defaultShuffleOrder.indices;
    widget.audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
          shuffleOrder: DefaultShuffleOrder(), children: audioSources),
    );
    widget.audioPlayer.play();
  }

  @override
  void dispose() {
    super.dispose();
    widget.audioPlayer.setShuffleModeEnabled(false);
  }

  Stream<SeekBarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        widget.audioPlayer.positionStream,
        widget.audioPlayer.durationStream,
            (Duration position, Duration? duration) {
          return SeekBarData(
              position: position, duration: duration ?? Duration.zero);
        },
      );
}

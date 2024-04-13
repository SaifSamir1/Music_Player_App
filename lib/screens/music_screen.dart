import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../widgets/music_screen_body.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key, required this.musicFile, required this.allMusicFiles, required this.audioPlayer});
  final SongModel musicFile;
  final List<SongModel> allMusicFiles;
  final AudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: MusicScreenBody(
        musicFile: musicFile, allMusicFiles: allMusicFiles, audioPlayer: audioPlayer,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}


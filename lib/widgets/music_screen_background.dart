import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/widgets/song_title.dart';
import 'package:on_audio_query/on_audio_query.dart';


class BackGround extends StatelessWidget {
  const BackGround({
    super.key, required this.musicFile, required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;
  final List<SongModel> musicFile ;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white.withOpacity(.5),
            Colors.white.withOpacity(0.0),
          ],
          stops: const [0.0, 0.4, 0.6],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade800,
            ],
          ),
        ),
        child: SongTitle(musicFile: musicFile, audioPlayer: audioPlayer,),

      ),
    );
  }
}

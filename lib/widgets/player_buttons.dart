import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/widgets/play_next_button.dart';
import 'package:music_player/widgets/play_pause_button.dart';
import 'package:music_player/widgets/play_previous_button.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ShuffleButton(audioPlayer: audioPlayer),
        // SizedBox(width: MediaQuery.sizeOf(context).width * .08,),
        PreviousButton(audioPlayer: audioPlayer),
        PlayPauseButton(audioPlayer: audioPlayer),
        NextButton(audioPlayer: audioPlayer),
      ],
    );
  }
}


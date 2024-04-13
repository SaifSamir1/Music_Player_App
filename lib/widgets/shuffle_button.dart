


import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        audioPlayer.setShuffleModeEnabled(true);
      },
      icon: const Icon(Icons.shuffle,color: Colors.white, size: 30,),
    );
  }
}
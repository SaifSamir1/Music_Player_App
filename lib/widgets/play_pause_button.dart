import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          final playerState = snapShot.data;
          final processingState = playerState!.processingState;
          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return IconButton(
              iconSize: 75,
              onPressed: audioPlayer.play,
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            );
          } else if (!audioPlayer.playing) {
            return IconButton(
              iconSize: 75,
              onPressed: audioPlayer.play,
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            );
          } else if (processingState != ProcessingState.completed) {
            return IconButton(
              iconSize: 75,
              onPressed: audioPlayer.pause,
              icon: const Icon(
                Icons.pause_circle,
                color: Colors.white,
              ),
            );
          } else {
            return IconButton(
              iconSize: 75,
              onPressed: () => audioPlayer.seek(
                Duration.zero,
                index: audioPlayer.effectiveIndices!.first,
              ),
              icon: const Icon(
                Icons.replay_circle_filled_outlined,
                color: Colors.white,
              ),
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}


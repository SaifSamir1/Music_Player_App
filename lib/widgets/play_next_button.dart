import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/manger/music__cubit.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(
        stream: audioPlayer.sequenceStateStream,
        builder: (context, index) {
          return IconButton(
              onPressed:(){
                BlocProvider.of<MusicCubit>(context).increaseTheSongIndex();
                audioPlayer.hasNext
                    ? audioPlayer.seekToNext()
                    : null;
              },
              iconSize: 45,
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ));
        });
  }
}

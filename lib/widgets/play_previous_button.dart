import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/manger/music__cubit.dart';


class PreviousButton extends StatelessWidget {
  const PreviousButton({
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
              onPressed:()
              {
                if(BlocProvider.of<MusicCubit>(context).songsIndex >0)
                  {
                    BlocProvider.of<MusicCubit>(context).decreaseTheSongIndex();
                  }
                audioPlayer.hasPrevious ? audioPlayer.seekToPrevious() : null;
              },
              iconSize: 45,
              icon: const Icon(
                Icons.skip_previous,
                color: Colors.white,
              ));
        });
  }
}


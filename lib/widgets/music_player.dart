import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/manger/music__cubit.dart';
import 'package:music_player/widgets/player_buttons.dart';
import 'package:music_player/widgets/seek_bar.dart';
import '../models/seek_bar_data_model.dart';


class MusicPlayerTools extends StatelessWidget {
  const MusicPlayerTools({
    super.key,
    required this.seekBarDataStream,
    required this.audioPlayer,
  });

  final Stream<SeekBarData> seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<MusicCubit, MusicState>(
            builder: (context, state) {
              return StreamBuilder<SeekBarData>(
                  stream: seekBarDataStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data;
                    return SeekBar(
                      position: position?.position ?? Duration.zero,
                      duration: position?.duration ?? Duration.zero,
                      onChangeEnd: audioPlayer.seek,
                    );
                  });
            },
          ),
          PlayerButtons(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}

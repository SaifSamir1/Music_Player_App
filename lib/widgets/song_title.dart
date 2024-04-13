import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/manger/music__cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../utils/app_stayls.dart';

class SongTitle extends StatelessWidget {
  const SongTitle({
    super.key,
    required this.musicFile, required this.audioPlayer,
  });

  final List<SongModel> musicFile;
  final AudioPlayer audioPlayer;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, MusicState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
                flex: 4,
                child: SizedBox(height: 10,)),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    '     ${musicFile[BlocProvider.of<MusicCubit>(context).songsIndex].displayNameWOExt}',
                    maxLines: 1,
                    style: AppStyles.styleSemiBold24WithoutFontFamily(context)
                        .copyWith(
                        overflow: TextOverflow.ellipsis
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("${musicFile[BlocProvider.of<MusicCubit>(context).songsIndex].artist}",
                      style: AppStyles.styleSemiBold18(context)),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

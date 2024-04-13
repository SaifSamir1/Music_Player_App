

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../utils/app_stayls.dart';


class MusicListViewItem extends StatelessWidget {
  const MusicListViewItem({
    super.key, required this.songModel,
  });
  final SongModel songModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:QueryArtworkWidget(
        id: songModel.id,
        type: ArtworkType.AUDIO,
        nullArtworkWidget: const Icon(Icons.music_note,color: Colors.white,),
      ),
      title: Text(songModel.displayNameWOExt,
        maxLines: 1,
        style: AppStyles.styleSemiBold18(context).copyWith(
            overflow: TextOverflow.ellipsis
        ),),
      subtitle: Text("${songModel.artist}",style: AppStyles.styleSemiBold14(context)),
    );
  }
}

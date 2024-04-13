import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../screens/music_screen.dart';
import 'music_item.dart';

class SongsListView extends StatelessWidget {
  const SongsListView({
    super.key,
    required this.songs,
    required AudioPlayer audioPlayer,
  }) : _audioPlayer = audioPlayer;

  final List<SongModel> songs;
  final AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    final List<SongModel> allMusicFiles = [songs[index], ...songs];  // Replace ...otherSongModels with your list
                    return MusicScreen(
                      musicFile: songs[index],
                      allMusicFiles: allMusicFiles,
                      audioPlayer: _audioPlayer,
                    );
                  }
              ),
            );
          },
          child: MusicListViewItem(
            songModel: songs[index],
          ),
        );
      },
    );
  }
}

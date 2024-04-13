import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/widgets/songs_listview.dart';
import '../manger/audio_qoury_bloc/audio_query_bloc.dart';
import '../manger/audio_qoury_bloc/audio_query_state.dart';
import '../utils/app_stayls.dart';
import '../utils/fuctions/permission_hundler.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key, });

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 15, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Songs ",
            style: AppStyles.styleSemiBold24WithoutFontFamily(context),
          ),
          BlocBuilder<AudioQueryBloc, AudioQueryState>(
            builder: (context, state) {
              if (state is AudioQueryLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (state is AudioQueryLoaded) {
                final songs = state.songs;
                return Expanded(
                  child: SongsListView(songs: songs, audioPlayer: _audioPlayer),
                );
              }
              else if (state is AudioQueryError) {
                return Center(child: Text("Error: ${state.error}"));
              }
              else {
                return const SizedBox(); // Handle unexpected states
              }
            },
          ),
        ],
      ),
    );
  }
}


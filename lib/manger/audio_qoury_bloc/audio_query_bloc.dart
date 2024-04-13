

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'audio_query_event.dart';
import 'audio_query_state.dart';

class AudioQueryBloc extends Bloc<AudioQueryEvent, AudioQueryState> {
  final OnAudioQuery _audioQuery;


  AudioQueryBloc(this._audioQuery) : super(AudioQueryLoading()) {
    on<LoadSongsEvent>((event, emit) async {
      try {
        final songs = await _audioQuery.querySongs(
          ignoreCase: true,
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
        );
        emit(AudioQueryLoaded(songs: songs));
      } catch (error) {
        emit(AudioQueryError(error: error.toString()));
      }
    });
  }
}
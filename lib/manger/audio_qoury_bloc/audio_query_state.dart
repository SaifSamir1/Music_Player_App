

import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class AudioQueryState extends Equatable {
  const AudioQueryState();

  @override
  List<Object?> get props => [];
}

class AudioQueryLoading extends AudioQueryState {}

class AudioQueryLoaded extends AudioQueryState {
  final List<SongModel> songs;

  const AudioQueryLoaded({required this.songs});
}

class AudioQueryError extends AudioQueryState {
  final String error;

  const AudioQueryError({required this.error});
}
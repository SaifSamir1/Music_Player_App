

import 'package:equatable/equatable.dart';

abstract class AudioQueryEvent extends Equatable {
  const AudioQueryEvent();

  @override
  List<Object?> get props => [];
}

class LoadSongsEvent extends AudioQueryEvent {}

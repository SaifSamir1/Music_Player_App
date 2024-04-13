part of 'music__cubit.dart';

@immutable
sealed class MusicState {}

final class MusicInitial extends MusicState {}



final class ChangeDragValue extends MusicState {}

final class IncreaseTheSongIndex extends MusicState {}
final class DecreaseTheSongIndex extends MusicState {}

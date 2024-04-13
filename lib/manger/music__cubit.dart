
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'music__state.dart';

class MusicCubit extends Cubit<MusicState> {
  MusicCubit() : super(MusicInitial());


  double? dragValue;
  void changeTheDragValue(double value)
  {
    dragValue = value;
    emit(ChangeDragValue());
  }
  int songsIndex = 0;
  void increaseTheSongIndex(){
    songsIndex++;
    emit(IncreaseTheSongIndex());
  }
  void decreaseTheSongIndex(){
    songsIndex--;
    emit(DecreaseTheSongIndex());
  }
}

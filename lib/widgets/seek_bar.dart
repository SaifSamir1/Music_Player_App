

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/manger/music__cubit.dart';

class SeekBar extends StatelessWidget {
  const SeekBar(
      {super.key,
        required this.position,
        required this.duration,
        this.onChange,
        this.onChangeEnd});
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChange;
  final ValueChanged<Duration>? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_formatDuration(position)),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(
                disabledThumbRadius: 4,
                enabledThumbRadius: 4,
              ),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white.withOpacity(.2),
              thumbColor: Colors.white,
              overlayColor: Colors.white,
            ),
            child: Slider(
              min: 0.0,
              max:duration.inMilliseconds.toDouble(),
              value: min(
                BlocProvider.of<MusicCubit>(context).dragValue ?? position.inMilliseconds.toDouble(),
                duration.inMilliseconds.toDouble(),
              ),
              onChanged: (value) {
                BlocProvider.of<MusicCubit>(context).changeTheDragValue(value);
                if (onChange != null) {
                  onChange!(
                    Duration(
                      milliseconds: value.round(),
                    ),
                  );
                }
              },
              onChangeEnd: (value) {
                if (onChangeEnd != null) {
                  onChangeEnd!(
                    Duration(
                      milliseconds: value.round(),
                    ),
                  );
                }
                BlocProvider.of<MusicCubit>(context).dragValue = null;
              },
            ),
          ),
        ),
        Text(_formatDuration(duration)),
      ],
    );
  }
}

String _formatDuration(Duration duration) {
  if(duration == null)
  {
    return '__:__';
  }
  String twoDigits(int n) => n.toString().padLeft(2, " 0");
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$minutes:$seconds";
}
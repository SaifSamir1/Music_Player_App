import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/utils/app_stayls.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../manger/audio_qoury_bloc/audio_query_bloc.dart';
import '../manger/audio_qoury_bloc/audio_query_event.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _audioQueryBloc = AudioQueryBloc(OnAudioQuery());

  @override
  void initState() {
    super.initState();
    _audioQueryBloc.add(LoadSongsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: BlocProvider<AudioQueryBloc>(
        create: (context) => _audioQueryBloc,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context),
          body: const HomeScreenBody(),
        ),
      ),
    );
  }


  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepPurple.shade800.withOpacity(.7),
          Colors.deepPurple.shade200.withOpacity(.8),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Music Player",
        style: AppStyles.styleMedium20(context),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

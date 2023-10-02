import 'package:flutter/material.dart';
import 'package:musicplayer/views/songs_list_view.dart';

import 'views/music_player_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/SongsListView',
      routes: {
        '/SongsListView':(context)=> SongsListView(),
        '/MusicPlayerView':(context)=> MusicPlayerView(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        //
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SongsListView(),
    );
  }
}
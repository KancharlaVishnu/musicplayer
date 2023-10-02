import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayer/views/songs_list_view.dart';

import 'views/music_player_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/SongsListView',

      getPages: [
        GetPage(name:  '/SongsListView', page: ()=>SongsListView()),
        GetPage(name:  '/MusicPlayerView', page: ()=>MusicPlayerView())
      ],
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
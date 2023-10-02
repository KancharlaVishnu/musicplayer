import 'package:flutter/material.dart';
import 'package:musicplayer/song_model.dart';

class SongsListView extends StatelessWidget {
  const SongsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SongModel song1 = SongModel(
        'kaavaalaa',
        'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Kaavaalaa-MassTamilan.dev.mp3?alt=media&token=af3ee1af-f01b-4e7a-891d-4c803f3da934',
        'https://c.saavncdn.com/183/Kaavaalaa-From-Jailer-Tamil-2023-20230708073100-500x500.jpg',
        'Anirudh Ravichandran,Shilpa Rao');
    SongModel song2 = SongModel(
        'Hukum',
        'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Hukum---Thalaivar-Alappara-MassTamilan.dev.mp3?alt=media&token=32f817d6-99cc-4c5f-8ad9-a93c0acf2c73',
        'https://images.ottplay.com/images/jailer-615.jpg',
        'Anirudh Ravichandran, Super Subu');
    SongModel song3 = SongModel(
        'Jailer Theme',
        'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Jailer%20Theme%20(Instrumental).mp3?alt=media&token=bd4037ef-58f5-41cb-a90a-e2241ffae655',
        'https://static.toiimg.com/photo/msid-102601117/102601117.jpg',
        'Anirudh Ravichandran');
    SongModel song4 = SongModel(
        'Narasimha theme',
        'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Alappara%20Theme.mp3?alt=media&token=acff092f-64fa-4534-a06c-bb71a34df859',
        'https://pbs.twimg.com/media/FZDknGsagAA-lH-.jpg:large',
        'Anirudh Ravichandran');
    SongModel song5 = SongModel(
        'Mathew Theme',
        'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Muthuvel-Pandian-Theme-(Instrumental)-MassTamilan.dev.mp3?alt=media&token=d425dd21-72cd-477d-be92-d68ea11b4e95',
        'https://static.janbharattimes.com/wp-content/uploads/2023/01/jailer-movie-2023.jpg',
        'Anirudh Ravichandran');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          songview(song1.name, song1.thumbnailUrl, context, song1.artistInfo),
          SizedBox(
            height: 10,
          ),
          songview(song2.name, song2.thumbnailUrl, context, song2.artistInfo),
          SizedBox(
            height: 10,
          ),
          songview(song3.name, song3.thumbnailUrl, context, song3.artistInfo),
          SizedBox(
            height: 10,
          ),
          songview(song4.name, song4.thumbnailUrl, context, song4.artistInfo),
          SizedBox(
            height: 10,
          ),
          songview(song5.name, song5.thumbnailUrl, context, song5.artistInfo),
        ],
      ),
    );
  }

  songview(String name, String thumbnailUrl, BuildContext context,
      String artistInfo) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/MusicPlayerView');
      },
      child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              ClipOval(
                child: Image.network(
                  '$thumbnailUrl',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    '$artistInfo',
                    style: TextStyle(color: Colors.white54),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

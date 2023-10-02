import '../model/song_model.dart';

class DataManager {
  static List<SongModel> songsList() {
    return [
      SongModel(
        'kaavaalaa',
        'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Kaavaalaa-MassTamilan.dev.mp3?alt=media&token=af3ee1af-f01b-4e7a-891d-4c803f3da934',
        'https://c.saavncdn.com/183/Kaavaalaa-From-Jailer-Tamil-2023-20230708073100-500x500.jpg',
        'Anirudh Ravichandran,Shilpa Rao',
      ),
      SongModel(
          'Hukum',
          'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Hukum---Thalaivar-Alappara-MassTamilan.dev.mp3?alt=media&token=32f817d6-99cc-4c5f-8ad9-a93c0acf2c73',
          'https://images.ottplay.com/images/jailer-615.jpg',
          'Anirudh Ravichandran, Super Subu'),
      SongModel(
          'Jailer Theme',
          'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Jailer%20Theme%20(Instrumental).mp3?alt=media&token=bd4037ef-58f5-41cb-a90a-e2241ffae655',
          'https://static.toiimg.com/photo/msid-102601117/102601117.jpg',
          'Anirudh Ravichandran'),
      SongModel(
          'Narasimha theme',
          'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Alappara%20Theme.mp3?alt=media&token=acff092f-64fa-4534-a06c-bb71a34df859',
          'https://pbs.twimg.com/media/FZDknGsagAA-lH-.jpg:large',
          'Anirudh Ravichandran'),
      SongModel(
          'Mathew Theme',
          'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Muthuvel-Pandian-Theme-(Instrumental)-MassTamilan.dev.mp3?alt=media&token=d425dd21-72cd-477d-be92-d68ea11b4e95',
          'https://static.janbharattimes.com/wp-content/uploads/2023/01/jailer-movie-2023.jpg',
          'Anirudh Ravichandran'),
    ];
  }
}

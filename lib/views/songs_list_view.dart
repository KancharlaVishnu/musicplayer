import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayer/manager/data_manager.dart';
import 'package:musicplayer/model/song_model.dart';

class SongsListView extends StatelessWidget {
  const SongsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        padding: EdgeInsets.only(top: 100),
        itemCount: DataManager.songsList().length,
        itemBuilder: (BuildContext context, int index) {
          var model = DataManager.songsList()[index];
          return Column(
            children: [
              songView(
                model,
                context,
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        },
      ),
    );
  }

  Widget songView(
    SongModel model,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/MusicPlayerView', arguments: model);
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
                  '${model.thumbnailUrl}',
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
                    '${model.name}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    '${model.artistInfo}',
                    style: TextStyle(color: Colors.white54),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

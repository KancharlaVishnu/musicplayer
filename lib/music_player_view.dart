import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerView extends StatefulWidget {
  const MusicPlayerView({Key? key}) : super(key: key);

  @override
  State<MusicPlayerView> createState() => _MusicPlayerViewState();
}

class _MusicPlayerViewState extends State<MusicPlayerView> {
  final player = AudioPlayer()
    ..setUrl(
        'https://firebasestorage.googleapis.com/v0/b/musicplayer-15761.appspot.com/o/Hukum.mp3?alt=media&token=37aa5e05-61e1-4ed9-84cf-6d1c49fa5937')
    ..setVolume(1);
  bool isplaying = false;

  @override
  void initState() {
    super.initState();
    player.playerStateStream.listen((event) {
      setState(() {
        isplaying = event.playing;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
      player.stop();
      return true;
        },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            top: 199,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ClipOval(
                    child: SizedBox(
                  height: 199,
                  width: 199,
                  child: Image.network(
                    "https://www.hindustantimes.com/ht-img/img/2023/08/20/1600x900/jailer_500_crore_box_office_gross_1692501586703_1692501594990.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'HUKUM',
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fast_rewind_sharp,
                    color: Colors.black12,
                    size: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        if (player.playing) {
                          player.pause();
                        } else {
                          player.play();
                        }
                      },
                      child: Icon(
                        isplaying ? Icons.pause_circle : Icons.play_circle,
                        color: Colors.blue,
                        size: 50,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.fast_forward,
                    color: Colors.black12,
                    size: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

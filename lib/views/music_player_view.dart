import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:musicplayer/model/song_model.dart';

class MusicPlayerView extends StatefulWidget {
  const MusicPlayerView({Key? key}) : super(key: key);

  @override
  State<MusicPlayerView> createState() => _MusicPlayerViewState();
}

class _MusicPlayerViewState extends State<MusicPlayerView> {
  double _seekValue = 0.0; // Initial value
  var model = Get.arguments as SongModel;
  final player = AudioPlayer()
    ..setVolume(1);
  bool isplaying = false;

  @override
  void initState() {
    super.initState();
    player.setUrl('${model.songUrl}');
    player.play();
    player.playerStateStream.listen((event) {
      setState(() {
        isplaying = event.playing;
      });
    });

    player.positionStream.listen((event) {
      var max = player.duration?.inSeconds ?? 0;
      var currentValue = player.position.inSeconds;

      var onePercentageValue = max / 100;
      var seekbarPosition = currentValue / onePercentageValue;
      setState(() {
        print('seekBarValue - $seekbarPosition');
        _seekValue = seekbarPosition <= 0 ? 1 : seekbarPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        player.stop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: EdgeInsets.only(
            top: 050,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  height: 399,
                  width: double.infinity,
                  child: Image.network(
                    model.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    width: double.infinity,
                    child: Text(
                      '${model.name}',
                      style:
                          GoogleFonts.mooli(color: Colors.white, fontSize: 26),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      '${model.artistInfo}',
                      style: TextStyle(color: Colors.white60, fontSize: 20),
                    ),
                  )
                ],
              ),
              // FlutterSlider(
              //   values: [_seekValue],
              //   max: 100.0, // Set the maximum value of the seek bar
              //   min: 0.0, // Set the minimum value of the seek bar
              //   onDragging: (handlerIndex, lowerValue, upperValue) {
              //     setState(() {
              //       _seekValue = lowerValue;
              //       // Update your music player's position based on _seekValue
              //     });
              //   },
              // ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fast_rewind_sharp,
                    color: Colors.white,
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
                        color: Colors.white,
                        size: 76,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.fast_forward,
                    color: Colors.white,
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

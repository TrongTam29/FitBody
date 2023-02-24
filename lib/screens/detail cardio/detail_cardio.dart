import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/screens/detail%20cardio/component/timer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailCardio extends StatefulWidget {
  DetailCardio(
      {required this.url,
      required this.nameCarido,
      required this.breakTime,
      required this.duration,
      required this.exerTime,
      required this.focus});

  final String url;
  final String nameCarido;
  final String duration;
  final String exerTime;
  final String breakTime;
  final String focus;

  @override
  _DetailCardioState createState() => _DetailCardioState();
}

class _DetailCardioState extends State<DetailCardio> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        Size size = MediaQuery.of(context).size;
        var textStyle = TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 24);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                ClipRRect(
                  child: player,
                ),
                ListTile(
                  title: Text(
                    widget.nameCarido,
                    style: textStyle,
                  ),
                  subtitle: Text(
                    'Cardio and Lose weight',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: size.height * 0.1 - 80,
                    ),
                    Divider(thickness: 1, color: Color(0xE68F839C)),
                    Row(
                      children: [
                        TextInfo(
                          nameInfo: 'Duration',
                          info: '10 mins',
                        ),
                        TextInfo(
                          nameInfo: 'An Exercise',
                          info: '45 sec',
                        ),
                        TextInfo(
                          nameInfo: 'Break',
                          info: '15 sec',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextInfo(
                          nameInfo: 'Calorie Burn',
                          info: '200 - 300',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextInfo(
                          nameInfo: 'Body Focus',
                          info: 'Total Body',
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFE68F839C),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TimerApp(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({required this.nameInfo, required this.info});
  final String nameInfo;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
      child: RichText(
        text: TextSpan(
            text: nameInfo + '\n',
            style: TextStyle(fontSize: 18, color: Color(0xE68F839C)),
            children: [
              TextSpan(
                  text: info,
                  style: TextStyle(fontSize: 22, color: Colors.black)),
            ]),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:my_app/model/exerciseComment/exerciseComment_controller.dart';
import 'package:my_app/model/exerciseComment/exerciseComment_model.dart';
import 'package:my_app/model/user/user_controller.dart';
import 'package:my_app/model/user/user_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:web_socket_channel/io.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constants.dart';

class DetailVideo extends StatefulWidget {
  DetailVideo({
    required this.id,
    required this.url,
    required this.nameExercise,
    required this.breaks,
    required this.detail,
    required this.reps,
    required this.sets,
  });
  final int id;
  final String url;
  final String nameExercise;
  final String sets;
  final String reps;
  final String breaks;
  final String detail;

  @override
  _DetailVideoState createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {
  late YoutubePlayerController _controller;
  final TextEditingController commentController = TextEditingController();
  final channel = IOWebSocketChannel.connect(baseWsUrl);
  var user = FirebaseAuth.instance.currentUser;
  UserController userController = Get.put(UserController());
  ExerciseCommentController exerciseCommentController =
      Get.put(ExerciseCommentController());

  var userId;
  late Comment _comment;
  late UserComment userComment;
  List<String> messages = [];
  List<UserComment> userCommentList = [];

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: YoutubePlayerFlags(
        startAt: 10,
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
    takeUserId();
    fetchUserCommentList();
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
    channel.sink.close();
    super.dispose();
  }

  void takeUserId() {
    userController.findUser(user!.email!).then((result) {
      setState(() {
        userId = result!.id!;
      });
    });
  }

  void fetchUserCommentList() {
    exerciseCommentController.fetchExerciseComment(widget.id).then((result) {
      for (var i in result!) {
        userController.findUserById(i.userId!).then((value) {
          setState(() {
            userComment = UserComment(
                name: value!.name, image: value.image, comment: i.comment);
            userCommentList.add(userComment);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          var textStyle =
              TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 24);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        child: player,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        widget.nameExercise,
                        style: textStyle,
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            share(context, widget.url);
                          },
                          icon: Icon(
                            Icons.share_rounded,
                            size: 25,
                            color: Colors.black,
                          )),
                      subtitle: Text('Gym guide - Chest'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          margin: EdgeInsets.only(top: 15, bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          color: Color(0xFFDFCDCD),
                          elevation: 10,
                          child: Container(
                            width: size.width * 0.3 - 5,
                            height: size.height * 0.2 - 20,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Icon(Icons.access_alarm_outlined),
                                  trailing: Text(
                                    'Reps',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Poppins-SemiBold'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                ),
                                Text(
                                  widget.reps,
                                  style: textStyle,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(top: 15, bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          color: Color(0xFFD8D0E0),
                          elevation: 10,
                          child: Container(
                            width: size.width * 0.3 - 5,
                            height: size.height * 0.2 - 20,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Icon(Icons.fact_check_outlined),
                                  trailing: Text(
                                    'Sets',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontFamily: 'Poppins-SemiBold'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                ),
                                Text(
                                  widget.sets,
                                  style: textStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(top: 15, bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          color: Color(0xFFDAD2D2),
                          elevation: 10,
                          child: Container(
                            width: size.width * 0.3 - 5,
                            height: size.height * 0.2 - 20,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Icon(
                                    Icons.skip_next_outlined,
                                    size: 30,
                                  ),
                                  trailing: Text(
                                    'Break',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Poppins-SemiBold'),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                ),
                                Text(
                                  widget.breaks,
                                  style: TextStyle(
                                      fontFamily: 'Poppins-SemiBold',
                                      fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      // child: Html(
                      //   data: widget.detail,
                      //   defaultTextStyle: 
                      //      TextStyle(
                            
                      //         // fontSize: FontSize(18.0),
                      //         fontFamily: 'Poppins-Light',
                      //         color: Colors.black,
                      //         // lineHeight: LineHeight(1.8),
                      //         // textAlign: TextAlign.justify,
                      //         ),
                        
                      // ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    StreamBuilder(
                        stream: channel.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData == true) {
                            userComment = UserComment(
                                name: user!.displayName!,
                                image: user!.photoURL!,
                                comment: '${snapshot.data}');

                            userCommentList.add(userComment);
                          }
                          return Column(
                            children: [
                              for (var index in userCommentList)
                                ListTile(
                                  minLeadingWidth: 2,
                                  leading: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                        index.image!,
                                      )),
                                  title: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey[200]),
                                    child: RichText(
                                      text: TextSpan(
                                          text: '${index.name}\n',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins-SemiBold',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text: index.comment,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize: 17,
                                                  fontFamily:
                                                      'PragatiNarrow-Regular',
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 10),
                          height: 40,
                          width: size.width * 0.8,
                          child: TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              hintText: ' Write a comment...',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding:
                                  EdgeInsets.only(bottom: 1, left: 8),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10, left: 10),
                          child: IconButton(
                              onPressed: () {
                                print(messages);
                                setState(() {
                                  _comment = Comment(
                                      userId: userId,
                                      exerciseId: widget.id,
                                      comment: commentController.text);
                                });
                                comment();
                                commentController.clear();
                                FocusScope.of(context).unfocus();
                              },
                              icon: Icon(
                                Icons.send_rounded,
                                size: 30,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> comment() async {
    channel.sink.add(exerciseCommentModelToJson(_comment));
  }

  void share(BuildContext context, String link) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    Share.share(link,
        subject: 'Fit Body app',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}

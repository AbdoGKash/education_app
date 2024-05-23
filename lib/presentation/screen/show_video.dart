// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'package:education_app/controller_bloc/internet_check/internet_check_bloc.dart';
import 'package:education_app/core/helper/app_localizations.dart';
import 'package:education_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/styles_manager.dart';
import 'package:url_launcher/url_launcher.dart';

const NAME = 'name';
const LINK = 'link';

class ShowVideo extends StatefulWidget {
  final course;
  const ShowVideo({Key? key, this.course}) : super(key: key);

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  late String title, author;
  late bool isPlaying, isMute;
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;
  playerInit() {
    id = YoutubePlayer.convertUrlToId(widget.course[LINK])!;
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    youtubePlayer = YoutubePlayer(
      controller: _controller,
    );
    isPlaying = _controller.value.isPlaying;
  }

  @override
  void initState() {
    super.initState();
    playerInit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: AppBarManger.appBarManger(widget.course[NAME]),
        body: BlocBuilder<InternetCheckBloc, InternetCheckState>(
          builder: (context, state) {
            if (state is ConnectedState) {
              return ListView(
                children: [
                  SizedBox(
                    height: AppSize.s250,
                    width: AppSize.s400,
                    child: youtubePlayer,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buttonRowBuilder(),
                  const SizedBox(
                    height: 30,
                  ),
                  internetWeak(),
                ],
              );
            } else if (state is NotConnectedState) {
              return Center(
                child: Column(children: [
                  Lottie.asset(
                    LottieAssets.noData,
                    height: 200,
                  ),
                  Text("Please Check Internet !".tr(context),
                      style: TextStyleManger.bodyLarge()),
                ]),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  buttonRowBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (_controller.value.position <= const Duration(seconds: 10)) {
              _controller.seekTo(const Duration(seconds: 0));
            } else {
              var p = _controller.value.position - const Duration(seconds: 10);
              _controller.seekTo(p);
            }
          },
          icon: Icon(
            Icons.first_page,
            color: ColorManager.primary2,
          ),
          iconSize: AppSize.s35,
        ),
        IconButton(
          onPressed: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
            setState(() {
              isPlaying = !isPlaying;
            });
          },
          icon: isPlaying
              ? const Icon(Icons.pause)
              : Icon(Icons.play_arrow, color: ColorManager.primary2),
          iconSize: AppSize.s35,
        ),
        IconButton(
          onPressed: () {
            var newPostion =
                _controller.value.position + const Duration(seconds: 10);
            _controller.seekTo(newPostion);
          },
          icon: Icon(Icons.last_page, color: ColorManager.primary2),
          iconSize: AppSize.s35,
        ),
      ],
    );
  }

  Widget internetWeak() {
    return SizedBox(
      width: AppSize.s300,
      height: AppSize.s50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Internet is weak ?  ".tr(context),
            style: TextStyleManger.bodyLarge(),
          ),
          InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(widget.course['link']));
              },
              child: Text(
                "Click here".tr(context),
                style: TextStyleManger.bodyLarge(),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

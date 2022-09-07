import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:play_music_test/models/songs_model.dart';
import 'package:play_music_test/providers/songs_provider.dart';
import 'package:play_music_test/services/songs_services.dart';
import 'package:play_music_test/widgets/custom_list_tile.dart';
import 'package:play_music_test/widgets/search_box.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer player = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = '';

  Icon iconButton = const Icon(Icons.play_arrow);

  Duration duration = const Duration();
  Duration position = const Duration();

  void playMusic(String url) async {
    final provider = Provider.of<SongsProvider>(context, listen: false);
    if (isPlaying && provider.curruntlyPlying.previewUrl != url) {
      player.pause();
      int result = await player.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    } else if (!isPlaying) {
      int result = await player.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }

    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    player.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  void initState() {
    getSongs();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void getSongs() {
    final provider = Provider.of<SongsProvider>(context, listen: false);
    SongsServices.fetchSongs().then((value) {
      if (value.statusCode == 200) {
        final res = jsonDecode(value.body).cast<String, dynamic>();
        final results = res["results"].cast<Map<String, dynamic>>().toList();

        List<SongsModel> val = results
            .map<SongsModel>((value) => SongsModel.fromJson(value))
            .toList();

        provider.songs = val;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("MUSIK QU")),
        body: Consumer<SongsProvider>(
          builder: (_, provider, child) {
            return Column(
              children: [
                const SearchBox(),
                provider.isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : Expanded(
                        child: ListView(
                        children: provider.songs
                            .map((e) => customListTitle(e,
                                    isPlying: e.artistName ==
                                        provider.curruntlyPlying.artistName,
                                    onTap: () {
                                  playMusic(e.previewUrl.toString());
                                  provider.curruntlyPlying = e;
                                }))
                            .toList(),
                      )),
                if (provider.curruntlyPlying.artistName != '')
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.grey)]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                  '${position.inMinutes}:${position.inSeconds.remainder(60)}'),
                              Expanded(
                                child: Slider.adaptive(
                                  value: position.inSeconds.toDouble(),
                                  min: 0.0,
                                  max: duration.inSeconds.toDouble(),
                                  onChanged: (double value) {
                                    Duration newDuration =
                                        Duration(seconds: value.toInt());
                                    setState(() {
                                      position = newDuration;
                                    });
                                    player.seek(newDuration);
                                  },
                                ),
                              ),
                              Text(
                                  '${duration.inMinutes}:${duration.inSeconds.remainder(60)}'),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: NetworkImage(provider
                                            .curruntlyPlying.artworkUrl100!))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(provider.curruntlyPlying.artistName!),
                                    Text(provider
                                        .curruntlyPlying.trackCensoredName!),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    if (isPlaying) {
                                      player.pause();
                                      setState(() {
                                        iconButton =
                                            const Icon(Icons.play_arrow);
                                        isPlaying = false;
                                      });
                                    } else {
                                      player.resume();
                                      setState(() {
                                        iconButton = const Icon(Icons.pause);
                                        isPlaying = true;
                                      });
                                    }
                                  },
                                  icon: iconButton)
                            ],
                          )
                        ]),
                  )
              ],
            );
          },
        ));
  }
}

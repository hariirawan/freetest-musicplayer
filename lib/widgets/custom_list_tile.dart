import 'package:flutter/material.dart';
import 'package:play_music_test/models/songs_model.dart';

Widget customListTitle(SongsModel model,
    {Function? onTap, bool isPlying = false}) {
  return InkWell(
    onTap: () => onTap!(),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                    image: NetworkImage(model.artworkUrl100.toString()))),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Judul : ${model.trackCensoredName!}'),
                const SizedBox(
                  height: 5,
                ),
                Text('Artis :' + model.artistName!),
                const SizedBox(
                  height: 5,
                ),
                Text('Album :' + model.collectionName!),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            child: isPlying
                ? const Icon(Icons.stop)
                : const Icon(Icons.play_arrow_sharp),
          )
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:play_music_test/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SongsProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(),
      child: TextField(
        controller: provider.search,
        onChanged: (val) => provider.searchSongs(val),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Pencarian',
          contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        ),
      ),
    );
  }
}

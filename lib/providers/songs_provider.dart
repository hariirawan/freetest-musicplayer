import 'package:flutter/material.dart';
import 'package:play_music_test/models/songs_model.dart';

class SongsProvider with ChangeNotifier {
  List<SongsModel> _songs = [];
  List<SongsModel> _cpSongs = [];

  List<SongsModel> get songs => _songs;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  set songs(List<SongsModel> data) {
    _songs = data;
    _cpSongs = data;
    notifyListeners();
  }

  TextEditingController _search = TextEditingController(text: '');
  TextEditingController get search => _search;
  set search(TextEditingController text) {
    _search = text;
    notifyListeners();
  }

  SongsModel _currentlyPlying = SongsModel(artistName: "");

  SongsModel get curruntlyPlying => _currentlyPlying;
  set curruntlyPlying(SongsModel curruntlyPlying) {
    _currentlyPlying = curruntlyPlying;
    notifyListeners();
  }

  void searchSongs(String name) {
    List<SongsModel> data = List.from(songs);
    _songs = name != ""
        ? data
            .where((element) =>
                element.artistName!.contains(name) ||
                element.trackCensoredName!.contains(name))
            .toList()
        : _cpSongs;
    _currentlyPlying = SongsModel(artistName: "");
    notifyListeners();
  }
}

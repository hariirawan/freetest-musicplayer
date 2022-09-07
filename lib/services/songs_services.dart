import 'package:http/http.dart' as http;

class SongsServices {
  static Future<http.Response> fetchSongs() {
    String url = 'https://itunes.apple.com/search?term=jack+johnson&limit=25.';
    final response = http.get(Uri.parse(url));

    return response;
  }
}

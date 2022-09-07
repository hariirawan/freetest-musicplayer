class SongsModel {
  String? wrapperType;
  String? kind;
  int? artistId;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  bool? isStreamable;

  SongsModel(
      {this.wrapperType,
      this.kind,
      this.artistId,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.isStreamable});

  SongsModel.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    artistId = json['artistId'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    artistViewUrl = json['artistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    isStreamable = json['isStreamable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wrapperType'] = this.wrapperType;
    data['kind'] = this.kind;
    data['artistId'] = this.artistId;
    data['collectionId'] = this.collectionId;
    data['trackId'] = this.trackId;
    data['artistName'] = this.artistName;
    data['collectionName'] = this.collectionName;
    data['trackName'] = this.trackName;
    data['collectionCensoredName'] = this.collectionCensoredName;
    data['trackCensoredName'] = this.trackCensoredName;
    data['artistViewUrl'] = this.artistViewUrl;
    data['collectionViewUrl'] = this.collectionViewUrl;
    data['trackViewUrl'] = this.trackViewUrl;
    data['previewUrl'] = this.previewUrl;
    data['artworkUrl30'] = this.artworkUrl30;
    data['artworkUrl60'] = this.artworkUrl60;
    data['artworkUrl100'] = this.artworkUrl100;
    data['collectionPrice'] = this.collectionPrice;
    data['trackPrice'] = this.trackPrice;
    data['isStreamable'] = this.isStreamable;
    return data;
  }
}

List<SongsModel> listSongs = [
  SongsModel(
      wrapperType: "track",
      kind: "song",
      artistId: 909253,
      collectionId: 1469577723,
      trackId: 1469577741,
      artistName: "Jack Johnson",
      collectionName:
          "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
      trackName: "Upside Down",
      collectionCensoredName:
          "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
      trackCensoredName: "Upside Down",
      artistViewUrl:
          "https://music.apple.com/us/artist/jack-johnson/909253?uo=4",
      collectionViewUrl:
          "https://music.apple.com/us/album/upside-down/1469577723?i=1469577741&uo=4",
      trackViewUrl:
          "https://music.apple.com/us/album/upside-down/1469577723?i=1469577741&uo=4",
      previewUrl:
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/5e/5b/3d/5e5b3df4-deb5-da78-5d64-fe51d8404d5c/mzaf_13341178261601361485.plus.aac.p.m4a",
      artworkUrl30:
          "https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/08/11/d2/0811d2b3-b4d5-dc22-1107-3625511844b5/00602537869770.rgb.jpg/30x30bb.jpg",
      artworkUrl60:
          "https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/08/11/d2/0811d2b3-b4d5-dc22-1107-3625511844b5/00602537869770.rgb.jpg/60x60bb.jpg",
      artworkUrl100:
          "https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/08/11/d2/0811d2b3-b4d5-dc22-1107-3625511844b5/00602537869770.rgb.jpg/100x100bb.jpg",
      collectionPrice: 9.99,
      trackPrice: 1.29),
  SongsModel(
      wrapperType: "track",
      kind: "song",
      artistId: 115234,
      collectionId: 1440869641,
      trackId: 1440869921,
      artistName: "Weezer",
      collectionName: "Weezer (Deluxe Edition)",
      trackName: "Buddy Holly",
      collectionCensoredName: "Weezer (Deluxe Edition)",
      trackCensoredName: "Buddy Holly",
      artistViewUrl: "https://music.apple.com/us/artist/weezer/115234?uo=4",
      collectionViewUrl:
          "https://music.apple.com/us/album/buddy-holly/1440869641?i=1440869921&uo=4",
      trackViewUrl:
          "https://music.apple.com/us/album/buddy-holly/1440869641?i=1440869921&uo=4",
      previewUrl:
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/28/9a/bb/289abbbc-36a0-14d2-a080-2f40af4a5820/mzaf_2008064258335924942.plus.aac.p.m4a",
      artworkUrl30:
          "https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/5b/de/65/5bde6532-3029-cce8-6e8b-9838d838d791/16UMGIM52970.rgb.jpg/30x30bb.jpg",
      artworkUrl60:
          "https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/5b/de/65/5bde6532-3029-cce8-6e8b-9838d838d791/16UMGIM52970.rgb.jpg/60x60bb.jpg",
      artworkUrl100:
          "https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/5b/de/65/5bde6532-3029-cce8-6e8b-9838d838d791/16UMGIM52970.rgb.jpg/100x100bb.jpg",
      collectionPrice: 13.99,
      trackPrice: 1.29)
];

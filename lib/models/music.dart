class Music {
  String? musicname;
  bool? checked;

  Music(this.musicname, this.checked);

  static getMusic() {
    return [
      Music('POP ', false),
      Music('ROCK ', false),
      Music('JAZZ ', false),
      Music('RAP ', false),
      Music('BLUES ', false),
    ];
  }
}

class Album {

  final String id;
  final String name;
  final String author;
  final int year;
  final String albumArt;
  final List<Song> songs;

  Album({
    required this.id,
    required this.author,
    required this.year,
    required this.albumArt,
    required this.name,
    this.songs = const [],
  });

}

class Song {

  final String id;
  final String title;
  final Duration duration;
  final String author;
  final int position;
  
  Song({
    required this.id,
    required this.title,
    required this.author,
    required this.duration,
    required this.position,
  });

}
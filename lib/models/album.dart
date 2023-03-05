class Album {

  final String id;
  final String? name;
  final String? author;
  final int? year;
  final String? albumArt;
  final List<Song> songs;

  Album({
    required this.id,
    this.author,
    this.year,
    this.albumArt,
    this.name,
    this.songs = const [],
  });

}

class Song {

  final String id;
  final String? title;
  final String? duration;
  final int? position;
  
  Song({
    required this.id,
    this.title,
    this.duration,
    this.position,
  });

}
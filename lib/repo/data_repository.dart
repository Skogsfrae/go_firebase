import 'package:go_firebase/models/album.dart';
import 'package:collection/collection.dart' show IterableExtension;


class AlbumRepository {

  static List<Album> fetchAlbumList() => _albumList;

  static Album? fetchAlbumById({required String albumId}) => _albumList.firstWhereOrNull((album) => album.id == albumId );

}

List<Album> _albumList = [
  Album(
      id: "B-01",
      name: "Thriller",
      author: "Michael Jackson",
      year: 1982,
      albumArt: "https://upload.wikimedia.org/wikipedia/en/5/55/Michael_Jackson_-_Thriller.png",
      songs: [
        Song(id: "B-01-01", title: "Wanna Be Startin' Somethin'", duration: "6:03", position: 1),
        Song(id: "B-01-02", title: "Baby Be Mine", duration: "4:20", position: 2),
        Song(id: "B-01-03", title: "The Girl Is Mine", duration: "3:42", position: 3),
        Song(id: "B-01-04", title: "Thriller", duration: "5:57", position: 4),
        Song(id: "B-01-05", title: "Beat It", duration: "4:18", position: 5),
        Song(id: "B-01-06", title: "Billie Jean", duration: "4:54", position: 6),
        Song(id: "B-01-07", title: "Human Nature", duration: "4:06", position: 7),
        Song(id: "B-01-08", title: "P.Y.T. (Pretty Young Thing)", duration: "3:59", position: 8),
        Song(id: "B-01-09", title: "The Lady in My Life", duration: "4:57", position: 9),
      ],
    ),
  Album(
      id: "Q-01",
      name: "Queen's Greatest Hits",
      author: "Queen",
      year: 1981,
      albumArt: "https://upload.wikimedia.org/wikipedia/en/0/02/Queen_Greatest_Hits.png",
      songs: [
        Song(id: "Q-01-01", title: "Bohemian Rhapsody", duration: "5:55", position: 1),
        Song(id: "Q-01-02", title: "Another One Bites the Dust", duration: "3:36", position: 2),
        Song(id: "Q-01-03", title: "Killer Queen", duration: "3:01", position: 3),
        Song(id: "Q-01-04", title: "Fat Bottomed Girls", duration: "3:22", position: 4),
        Song(id: "Q-01-05", title: "Bicycle Race", duration: "3:01", position: 5),
        Song(id: "Q-01-06", title: "You're My Best Friend", duration: "2:52", position: 6),
        Song(id: "Q-01-07", title: "Don't Stop Me Now", duration: "3:31", position: 7),
      ],
  ),
  Album(
  id: "T-01",
  name: "Back in Black",
  author: "AC/DC",
  year: 1980,
  albumArt: "https://upload.wikimedia.org/wikipedia/commons/b/be/Acdc_backinblack_cover.jpg",
  songs: [
    Song(id: "T-01-01", title: "Hells Bells", duration: "5:12", position: 1),
    Song(id: "T-01-02", title: "Shoot to Thrill", duration: "5:17", position: 2),
    Song(id: "T-01-03", title: "What Do You Do for Money Honey", duration: "3:36", position: 3),
    Song(id: "T-01-04", title: "Givin the Dog a Bone", duration: "3:31", position: 4),
    Song(id: "T-01-05", title: "Let Me Put My Love into You", duration: "4:16", position: 5),
    Song(id: "T-01-06", title: "Back in Black", duration: "4:15", position: 6),
    Song(id: "T-01-07", title: "You Shook Me All Night Long", duration: "3:30", position: 7),
    Song(id: "T-01-08", title: "Have a Drink on Me", duration: "3:58", position: 8),
    Song(id: "T-01-09", title: "Shake a Leg", duration: "4:05", position: 9),
    Song(id: "T-01-10", title: "Rock and Roll Ain't Noise Pollution", duration: "4:15", position: 10),
  ],
)
];
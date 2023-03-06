import 'package:go_firebase/models/album.dart';
import 'package:collection/collection.dart' show IterableExtension;

class AlbumRepository {
  static List<Album> fetchAlbumList() => _albumList + _gorillazAlbums;

  static Album? fetchAlbumById({required String albumId}) =>
      fetchAlbumList().firstWhereOrNull((album) => album.id == albumId);

  static List<Album> mostListenedAlbums() => _albumList;
  static List<Album> gorillazAlbums() => _gorillazAlbums;
  static List<Album> croAlbums() => _croAlbums;
}

final List<Album> _croAlbums = [
  Album(
    id: 'CR-RA-01',
    name: 'Raop',
    author: 'Cro',
    year: 2012,
    albumArt: 'https://upload.wikimedia.org/wikipedia/en/2/2e/Cro_Raop_Cover_Standard_Version.jpeg',
    songs: [
      Song(
        id: 'CR-RA-01-01',
        title: 'Intro',
        author: 'Cro',
        duration: const Duration(minutes: 1, seconds: 16),
        position: 1,
      ),
      Song(
        id: 'CR-RA-01-02',
        title: 'Easy',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 51),
        position: 2,
      ),
      Song(
        id: 'CR-RA-01-03',
        title: 'Wir waren hier',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 26),
        position: 3,
      ),
      Song(
        id: 'CR-RA-01-04',
        title: 'Du',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 23),
        position: 4,
      ),
      Song(
        id: 'CR-RA-01-05',
        title: 'King of Raop',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 25),
        position: 5,
      ),
      Song(
        id: 'CR-RA-01-06',
        title: 'Meine Zeit',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 24),
        position: 6,
      ),
      Song(
        id: 'CR-RA-01-07',
        title: 'Begleitmusik',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 38),
        position: 7,
      ),
      Song(
        id: 'CR-RA-01-08',
        title: 'Konfetti',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 9),
        position: 8,
      ),
      Song(
        id: 'CR-RA-01-09',
        title: 'Genauso',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 37),
        position: 9,
      ),
      Song(
        id: 'CR-RA-01-10',
        title: 'Kein Benz',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 25),
        position: 10,
      ),
      Song(
        id: 'CR-RA-01-11',
        title: 'Höhenangst',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 20),
        position: 11,
      ),
      Song(
        id: 'CR-RA-01-12',
        title: 'Nie mehr',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 15),
        position: 12,
      ),
      Song(
        id: 'CR-RA-01-13',
        title: 'Diese Wiege',
        author: 'Cro',
        duration: const Duration(minutes: 3, seconds: 35),
        position: 13,
      ),
    ],
  ),
];

final List<Album> _gorillazAlbums = [
  Album(
    id: 'GO-GR-01',
    name: 'Gorillaz',
    author: 'Gorillaz',
    year: 2001,
    albumArt:
        'https://upload.wikimedia.org/wikipedia/en/4/41/GorillazAlbum.jpg',
    songs: [
      Song(
        id: 'GR-GR-01-1',
        title: 'Re-Hash',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 38),
        position: 1,
      ),
      Song(
        id: 'GR-GR-01-2',
        title: '5/4',
        author: 'Gorillaz',
        duration: const Duration(minutes: 2, seconds: 39),
        position: 2,
      ),
      Song(
        id: 'GR-GR-01-3',
        title: 'Tomorrow Comes Today',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 13),
        position: 3,
      ),
      Song(
        id: 'GR-GR-01-4',
        title: 'New Genious (Brother)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 57),
        position: 4,
      ),
      Song(
        id: 'GR-GR-01-5',
        title: 'Clint Eastwood',
        author: 'Gorillaz',
        duration: const Duration(minutes: 5, seconds: 55),
        position: 5,
      ),
      Song(
        id: 'GR-GR-01-6',
        title: 'Man Research (Clapper)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 29),
        position: 6,
      ),
      Song(
        id: 'GR-GR-01-7',
        title: 'Punk',
        author: 'Gorillaz',
        duration: const Duration(minutes: 1, seconds: 38),
        position: 7,
      ),
      Song(
        id: 'GR-GR-01-8',
        title: 'Sound Check (Gravity)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 41),
        position: 8,
      ),
      Song(
        id: 'GR-GR-01-9',
        title: 'Double Bass',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 44),
        position: 9,
      ),
      Song(
        id: 'GR-GR-01-10',
        title: 'Rock the House',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 09),
        position: 10,
      ),
      Song(
        id: 'GR-GR-01-11',
        title: '19-2000',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 27),
        position: 11,
      ),
    ],
  ),
  Album(
    id: 'GO-DE-05',
    name: 'Demon Days',
    author: 'Gorillaz',
    year: 2005,
    albumArt: 'https://m.media-amazon.com/images/I/71lix6+VfWL._AC_SL1425_.jpg',
    songs: [
      Song(
        id: 'GR-DA-05-1',
        title: 'Intro',
        author: 'Gorillaz',
        duration: const Duration(minutes: 1, seconds: 03),
        position: 1,
      ),
      Song(
        id: 'GR-DA-05-2',
        title: 'Last Living Souls',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 10),
        position: 2,
      ),
      Song(
        id: 'GR-DA-05-3',
        title: 'Kids With Guns',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 45),
        position: 3,
      ),
      Song(
        id: 'GR-DA-05-4',
        title: 'O Green World',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 33),
        position: 4,
      ),
      Song(
        id: 'GR-DA-05-5',
        title: 'Dirty Harry',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 51),
        position: 5,
      ),
      Song(
        id: 'GR-DA-05-6',
        title: 'Feel Good Inc.',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 41),
        position: 6,
      ),
      Song(
        id: 'GR-DA-05-7',
        title: 'El Mañana',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 50),
        position: 7,
      ),
      Song(
        id: 'GR-DA-05-8',
        title: 'Every Planet We Reach Is Dead',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 53),
        position: 8,
      ),
      Song(
        id: 'GR-DA-05-9',
        title: 'November Has Come',
        author: 'Gorillaz',
        duration: const Duration(minutes: 2, seconds: 41),
        position: 9,
      ),
      Song(
        id: 'GR-DA-05-10',
        title: 'All Alone',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 30),
        position: 10,
      ),
      Song(
        id: 'GR-DA-05-11',
        title: 'White Light',
        author: 'Gorillaz',
        duration: const Duration(minutes: 2, seconds: 08),
        position: 11,
      ),
      Song(
        id: 'GR-DA-05-12',
        title: 'DARE',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 04),
        position: 12,
      ),
    ],
  ),
  Album(
    id: 'GR-PB-03',
    name: 'Plastic Beach',
    author: 'Gorillaz',
    year: 2010,
    albumArt: 'https://static.wikia.nocookie.net/kong/images/0/03/PB.jpg',
    songs: [
      Song(
        id: 'GR-PB-03-1',
        title: 'Orchestral Intro (feat. Sinfonia ViVA)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 1, seconds: 09),
        position: 1,
      ),
      Song(
        id: 'GR-PB-03-2',
        title:
            'Welcome to the World of the Plastic Beach (feat. Snoop Dogg and Hypnotic Brass Ensemble)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 35),
        position: 2,
      ),
      Song(
        id: 'GR-PB-03-3',
        title:
            'White Flag (feat. Bashy, Kano and The Lebanese National Orchestra for Oriental Arabic Music)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 42),
        position: 3,
      ),
      Song(
        id: 'GR-PB-03-4',
        title: 'Rhinestone Eyes',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 20),
        position: 4,
      ),
      Song(
        id: 'GR-PB-03-5',
        title: 'Stylo (feat. Mos Def and Bobby Womack)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 30),
        position: 5,
      ),
      Song(
        id: 'GR-PB-03-6',
        title: 'Superfast Jellyfish (feat. Gruff Rhys and De La Soul)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 2, seconds: 54),
        position: 6,
      ),
      Song(
        id: 'GR-PB-03-7',
        title: 'Empire Ants (feat. Little Dragon)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 44),
        position: 7,
      ),
      Song(
        id: 'GR-PB-03-8',
        title: 'Glitter Freeze (feat. Mark E. Smith)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 4, seconds: 03),
        position: 8,
      ),
      Song(
        id: 'GR-PB-03-9',
        title: 'Some Kind of Nature (feat. Lou Reed)',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 00),
        position: 9,
      ),
      Song(
        id: 'GR-PB-03-10',
        title: 'On Melancholy Hill',
        author: 'Gorillaz',
        duration: const Duration(minutes: 3, seconds: 54),
        position: 10,
      ),
      // ... add the remaining songs here
    ],
  ),
];

final List<Album> _albumList = [
  Album(
    id: "B-01",
    name: "Thriller",
    author: "Michael Jackson",
    year: 1982,
    albumArt:
        "https://upload.wikimedia.org/wikipedia/en/5/55/Michael_Jackson_-_Thriller.png",
    songs: [
      Song(
        id: "B-01-01",
        title: "Wanna Be Startin' Somethin'",
        author: "Michael Jackson",
        duration: const Duration(minutes: 6, seconds: 03),
        position: 1,
      ),
      Song(
        id: "B-01-02",
        title: "Baby Be Mine",
        author: "Michael Jackson",
        duration: const Duration(minutes: 4, seconds: 20),
        position: 2,
      ),
      Song(
        id: "B-01-03",
        title: "The Girl Is Mine",
        author: "Michael Jackson",
        duration: const Duration(minutes: 3, seconds: 42),
        position: 3,
      ),
      Song(
        id: "B-01-04",
        title: "Thriller",
        author: "Michael Jackson",
        duration: const Duration(minutes: 5, seconds: 57),
        position: 4,
      ),
      Song(
        id: "B-01-05",
        title: "Beat It",
        author: "Michael Jackson",
        duration: const Duration(minutes: 4, seconds: 18),
        position: 5,
      ),
      Song(
        id: "B-01-06",
        title: "Billie Jean",
        author: "Michael Jackson",
        duration: const Duration(minutes: 4, seconds: 54),
        position: 6,
      ),
      Song(
        id: "B-01-07",
        title: "Human Nature",
        author: "Michael Jackson",
        duration: const Duration(minutes: 4, seconds: 06),
        position: 7,
      ),
      Song(
        id: "B-01-08",
        title: "P.Y.T. (Pretty Young Thing)",
        author: "Michael Jackson",
        duration: const Duration(minutes: 3, seconds: 59),
        position: 8,
      ),
      Song(
        id: "B-01-09",
        title: "The Lady in My Life",
        author: "Michael Jackson",
        duration: const Duration(minutes: 4, seconds: 57),
        position: 9,
      ),
    ],
  ),
  Album(
    id: "Q-01",
    name: "Queen's Greatest Hits",
    author: "Queen",
    year: 1981,
    albumArt:
        "https://upload.wikimedia.org/wikipedia/en/0/02/Queen_Greatest_Hits.png",
    songs: [
      Song(
        id: "Q-01-01",
        title: "Bohemian Rhapsody",
        author: "Queen",
        duration: const Duration(minutes: 5, seconds: 55),
        position: 1,
      ),
      Song(
        id: "Q-01-02",
        title: "Another One Bites the Dust",
        author: "Queen",
        duration: const Duration(minutes: 3, seconds: 36),
        position: 2,
      ),
      Song(
        id: "Q-01-03",
        title: "Killer Queen",
        author: "Queen",
        duration: const Duration(minutes: 3, seconds: 01),
        position: 3,
      ),
      Song(
        id: "Q-01-04",
        title: "Fat Bottomed Girls",
        author: "Queen",
        duration: const Duration(minutes: 3, seconds: 22),
        position: 4,
      ),
      Song(
        id: "Q-01-05",
        title: "Bicycle Race",
        author: "Queen",
        duration: const Duration(minutes: 3, seconds: 01),
        position: 5,
      ),
      Song(
        id: "Q-01-06",
        title: "You're My Best Friend",
        author: "Queen",
        duration: const Duration(minutes: 2, seconds: 52),
        position: 6,
      ),
      Song(
        id: "Q-01-07",
        title: "Don't Stop Me Now",
        author: "Queen",
        duration: const Duration(minutes: 3, seconds: 31),
        position: 7,
      ),
    ],
  ),
  Album(
    id: "T-01",
    name: "Back in Black",
    author: "AC/DC",
    year: 1980,
    albumArt:
        "https://upload.wikimedia.org/wikipedia/commons/b/be/Acdc_backinblack_cover.jpg",
    songs: [
      Song(
        id: "T-01-01",
        title: "Hells Bells",
        author: "AC/DC",
        duration: const Duration(minutes: 5, seconds: 12),
        position: 1,
      ),
      Song(
        id: "T-01-02",
        title: "Shoot to Thrill",
        author: "AC/DC",
        duration: const Duration(minutes: 5, seconds: 17),
        position: 2,
      ),
      Song(
        id: "T-01-03",
        title: "What Do You Do for Money Honey",
        author: "AC/DC",
        duration: const Duration(minutes: 3, seconds: 36),
        position: 3,
      ),
      Song(
        id: "T-01-04",
        title: "Givin the Dog a Bone",
        author: "AC/DC",
        duration: const Duration(minutes: 3, seconds: 31),
        position: 4,
      ),
      Song(
        id: "T-01-05",
        title: "Let Me Put My Love into You",
        author: "AC/DC",
        duration: const Duration(minutes: 4, seconds: 16),
        position: 5,
      ),
      Song(
        id: "T-01-06",
        title: "Back in Black",
        author: "AC/DC",
        duration: const Duration(minutes: 4, seconds: 15),
        position: 6,
      ),
      Song(
        id: "T-01-07",
        title: "You Shook Me All Night Long",
        author: "AC/DC",
        duration: const Duration(minutes: 3, seconds: 30),
        position: 7,
      ),
      Song(
        id: "T-01-08",
        title: "Have a Drink on Me",
        author: "AC/DC",
        duration: const Duration(minutes: 3, seconds: 58),
        position: 8,
      ),
      Song(
        id: "T-01-09",
        title: "Shake a Leg",
        author: "AC/DC",
        duration: const Duration(minutes: 4, seconds: 05),
        position: 9,
      ),
      Song(
        id: "T-01-10",
        title: "Rock and Roll Ain't Noise Pollution",
        author: "AC/DC",
        duration: const Duration(minutes: 4, seconds: 15),
        position: 10,
      ),
    ],
  ),
];

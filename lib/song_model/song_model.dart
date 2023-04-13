import 'song.dart';
import 'song_database.dart';

class SongModel{
  final dbHelper = DbHelper();
  List<Song> song = [];

  Future<int> insert(Song song)  async{
    int rowId = await dbHelper.insert(song);

    return rowId;
  }

   Future<List<Song>> getAllSongs() async{
    song = await dbHelper.getAllSongs();
    return song;
   }
}
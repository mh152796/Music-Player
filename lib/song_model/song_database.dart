import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'song.dart';
import 'song_model.dart';
class DbHelper{
  final String _createTableSong = '''create table $tblName(
  $tblColId integer primary key autoincrement,
  $tblColSongName text,
  $tblColSongAlbumName text,
  $tblColSongImage text,
  $tblColFavorite integer,
  $tblColSongArtist text
  )''';

  Future<Database> _open() async{
    final path = await getDatabasesPath();
    final databaseName = join(path, 'song.db');
    return openDatabase(
      databaseName,
      version: 1,
      onCreate: (db, version) async{
    await db.execute(_createTableSong);
      },
    );
  }

  Future<int> insert(Song song) async {
    final db = await _open();
    return db.insert(tblName, song.toMap());
  }

  Future<List<Song>> getAllSongs() async {
    final db = await _open();
    final mapList = await db.query(tblName);
    
    return List.generate(mapList.length, (index) => Song.formMap(mapList[index]));
  }

}
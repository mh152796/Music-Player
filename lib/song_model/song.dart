import 'package:flutter/material.dart';

const String tblName = 'song';
const String tblColId = 'id';
const String tblColSongName = 'song_name';
const String tblColSongAlbumName = 'song_album';
const String tblColSongImage = 'image';
const String tblColFavorite = 'favorite';
const String tblColSongArtist = 'artist';

class Song {
  int id;
  int favorite;
  String songName;
  String albumName;
  String image;
  String artistName;

  Song(
      {required this.songName,
      this.albumName = 'Flume',
      this.id = -1,
      this.favorite = 0,
      this.image = 'No Image',
      required this.artistName});

  factory Song.formMap(Map<String, dynamic> map) {
    return Song(
      songName: map[tblColSongName],
      albumName: map[tblColSongAlbumName],
      image: map[tblColSongImage],
      id : map[tblColId],
      favorite: map[tblColFavorite],
      artistName: map[tblColSongArtist],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tblColSongName: songName,
      tblColSongAlbumName: albumName,
      tblColSongImage: image,
      tblColFavorite: favorite,
      tblColSongArtist: artistName,
    };
    if (id > 0) {
      map[tblColId] = id;
    }
    return map;
  }
}

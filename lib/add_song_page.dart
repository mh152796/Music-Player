import 'package:flutter/material.dart';
import 'package:untitled5/song_model/song_model.dart';

import 'song_model/song.dart';
class SongFormPage extends StatefulWidget {
  static const String routeName = '/add-song';

  const SongFormPage({Key? key}) : super(key: key);

  @override
  State<SongFormPage> createState() => _SongFormPageState();
}

class _SongFormPageState extends State<SongFormPage> {
  SongModel songModel = SongModel();
  final formKey = GlobalKey<FormState>();
  final songNameController = TextEditingController();
  final songAlbamNameController = TextEditingController();
  final songImageController = TextEditingController();
  final songArtistNameController = TextEditingController();

  @override
  void dispose() {
    songNameController.dispose();
    songAlbamNameController.dispose();
    songImageController.dispose();
    songArtistNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: songNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter song name',
                    filled: true,
                    prefixIcon: Icon(Icons.music_note),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Song name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: songAlbamNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter albam name',
                    filled: true,
                    prefixIcon: Icon(Icons.music_note),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Song name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: songImageController,
                  decoration: InputDecoration(
                    labelText: 'Enter image',
                    filled: true,
                    prefixIcon: Icon(Icons.music_note),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: songArtistNameController,
                  decoration: InputDecoration(
                    labelText: 'Artist name',
                    filled: true,
                    prefixIcon: Icon(Icons.music_note),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: ElevatedButton(onPressed: () {
                    _save();
                  }, child: Text('Save')),
                )
              ],
            )),
      ),
    );
  }

  void _save() {
    if (formKey.currentState!.validate()) {
      final song = Song(songName: songNameController.text,
        artistName: songArtistNameController.text,
        image: songImageController.text,
        albumName: songAlbamNameController.text,
      );
      songModel.insert(song).then((value) => Navigator.of(context).pop());


    }
  }
}

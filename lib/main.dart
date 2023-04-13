import 'package:flutter/material.dart';
import 'package:untitled5/details_page.dart';
import 'song_model/song_model.dart';
import 'add_song_page.dart';
import 'song_model/song.dart';
import 'song_model/song_model.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: MyApp.routeName,
    routes: {
      MyApp.routeName : (context) => MyApp(),
      Details.routeName : (context) => Details(),
      SongFormPage.routeName : (context) => SongFormPage(),
    },
  ));
}

class MyApp extends StatefulWidget {
  static const routeName = '/';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Song> song = [];

  @override
  void initState() {
  _getSongs();
 super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFDFE9FD),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Skin - FLUME',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blueGrey.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildIcon(40, 40, Icons.favorite),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                              'images/rose.png',
                            )),
                            color: Color(0xFFDEE7F6),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 8.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          height: 150,
                          width: 150,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(SongFormPage.routeName).then((value) {

                                _getSongs();
                              } );
                            },
                            child: buildIcon(40, 40, Icons.edit))
                      ],
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ListView.builder(
                    itemCount: song.length,
                      itemBuilder: (context, index) {
                        final sng = song[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(Details.routeName, arguments: sng);
                          },
                          child: ListTile(
                            trailing: buildIcon(30, 30, Icons.play_arrow),
                            title: Text(
                                sng.songName,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.8)
                              ),
                            ),
                            subtitle: Text('${sng.albumName} - ${sng.artistName}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),),
                          ),
                        );
                      },),
                )
            ),

          ],
        ),
      ),
    );
  }

  Container buildIcon(double height, double width, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFDEE7F6),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 8.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      height: height,
      width: width,
      child: icon == Icons.edit? GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(SongFormPage.routeName);
        },
        child: Icon(
          icon,
          color: Color(0xFF9FAEC7),
          size: 25,
        ),
      ): Icon(
        icon,
        color: Color(0xFF9FAEC7),
        size: 25,
      ),
    );
  }

  void _getSongs()  {

    setState(() {
        SongModel().getAllSongs().then((value) {
          song = value;
        });
    });
  }
}

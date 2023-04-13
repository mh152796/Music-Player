import 'package:flutter/material.dart';

import 'song_model/song.dart';

class Details extends StatefulWidget {
  static const routeName ='/details';

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double _value = 0;
  bool changeIcon = false;

  @override
  Widget build(BuildContext context) {
    var song = ModalRoute.of(context)!.settings.arguments as Song;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFDFE9FD),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
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
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF9FAEC7),
                      size: 25,
                    ),
                  ),
                ),
                Text(
                  "Playing Now",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Container(
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
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.menu,
                    color: Color(0xFF9FAEC7),
                    size: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
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
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              song.songName,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  letterSpacing: 1),
            ),
            Text(
              '${song.albumName} ft. ${song.artistName}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SliderTheme(
                data: SliderThemeData(
                    trackHeight: 10.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 17)),
                child: Slider(
                  value: _value,
                  min: 0.0,
                  max: 50,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.white70,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
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
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF9FAEC7),
                      size: 25,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          changeIcon = !changeIcon;
                        });
                      },
                      child: Icon(
                        changeIcon ? Icons.pause_circle : Icons.play_circle,
                        color: Colors.blue,
                        size: 60,
                      )),
                  Container(
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
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF9FAEC7),
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

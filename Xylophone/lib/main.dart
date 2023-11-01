// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int sound) {
    final player = AudioPlayer();
    player.play(AssetSource('sound$sound.wav'));
  }

  Expanded buildKey({color, sound}) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: color,
          ),
          onPressed: () {
            playSound(sound);
          },
          child: Text('Sound $sound'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: Colors.red, sound: 1),
                buildKey(color: Colors.orange, sound: 2),
                buildKey(color: Colors.yellow, sound: 3),
                buildKey(color: Colors.green, sound: 4),
                buildKey(color: Colors.blue, sound: 5),
                buildKey(color: Colors.purple, sound: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

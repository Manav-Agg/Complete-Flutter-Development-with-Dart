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

  Expanded buildRow({color1, sound1, color2, sound2}) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildKey(color: color1, sound: sound1),
          buildKey(color: color2, sound: sound2),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(
              child: Text('My Music'),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                buildRow(
                    color1: Colors.red,
                    sound1: 1,
                    color2: Colors.orange,
                    sound2: 2),
                buildRow(
                    color1: Colors.yellow,
                    sound1: 3,
                    color2: Colors.green,
                    sound2: 4),
                buildRow(
                    color1: Colors.blue,
                    sound1: 5,
                    color2: Colors.purple,
                    sound2: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());


class XylophoneApp extends StatelessWidget {

  // repeated ses çıkaran kısımlar için fonksiyon tamımladık
  // input verdik soundNumber olarak
  void playSound(int soundNumber){
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav')); // assets folder'ı tanıyor
  }

  //repeated key'ler (müzik butonu) için
  // Color ve Expanded data type olarak kullanıldı
  Expanded buildKey({required int keyNumber, Color? keyColor}) {
    //expanded ile aşağıya doğru çektirdik renkleri bütün ekranı eşit kapladı boyları
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(keyColor),
        ),
        onPressed: () async {
          playSound(keyNumber!);
        }, child: Text('Note $keyNumber', style: const TextStyle(color: Colors.black,),),),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: SafeArea(
          child: Center(
            child: Column(
              //sağa doğru uzattık renkleri
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(keyNumber: 1, keyColor: Colors.red),
                buildKey(keyNumber: 2, keyColor: Colors.teal),
                buildKey(keyNumber: 3, keyColor: Colors.yellow),
                buildKey(keyNumber: 4, keyColor: Colors.orange),
                buildKey(keyNumber: 5, keyColor: Colors.purple),
                buildKey(keyNumber: 6, keyColor: Colors.green),
                buildKey(keyNumber: 7, keyColor: Colors.pink),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

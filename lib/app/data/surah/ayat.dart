import 'package:skeleton/app/data/surah/audio_full.dart';

class Ayat {
  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });
  int nomorAyat;
  String teksArab;
  String teksLatin;
  String teksIndonesia;
  AudioFull audio;

  Ayat.empty()
      : nomorAyat = 0,
        teksArab = '',
        teksLatin = '',
        teksIndonesia = '',
        audio = AudioFull.empty();

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json['nomorAyat'],
        teksArab: json['teksArab'],
        teksLatin: json['teksLatin'],
        teksIndonesia: json['teksLatin'],
        audio: AudioFull.fromJson(json['audio']),
      );

  Map<String, dynamic> toJson() => {
        "nomorAyat": nomorAyat,
        "teksArab": teksArab,
        "teksLatin": teksLatin,
        "teksIndonesia": teksIndonesia,
        "audio": audio.toJson(),
      };
}

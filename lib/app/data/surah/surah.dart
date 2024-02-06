import 'package:skeleton/config/function_utils.dart';

import 'audio_full.dart';
import 'ayat.dart';
import 'tafsir.dart';

class Surah {
  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    // this.audio = '',
    required this.audioFull,
    this.ayat,
    this.tafsir,
  });
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  // String? audio;
  AudioFull audioFull;
  List<Ayat>? ayat;
  List<Tafsir>? tafsir;

  Surah.empty()
      : nomor = 0,
        nama = '',
        namaLatin = '',
        jumlahAyat = 0,
        tempatTurun = '',
        arti = '',
        deskripsi = '',
        // audio = '',
        audioFull = AudioFull.empty(),
        ayat = [],
        tafsir = [];

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['namaLatin'],
        jumlahAyat: json['jumlahAyat'],
        tempatTurun: json['tempatTurun'],
        arti: json['arti'],
        deskripsi: json['deskripsi'],
        // audio: json['audio'] ?? '',
        audioFull: isNotEmpty(json['audioFull']) ? AudioFull.fromJson(json['audioFull']) : AudioFull.empty(),
        ayat: isNotEmpty(json['ayat']) ? List<Ayat>.from(json['ayat'].map((e) => Ayat.fromJson(e))) : <Ayat>[],
        tafsir: isNotEmpty(json['tafsir']) ? List<Tafsir>.from(json['tafsir'].map((e) => Tafsir.fromJson(e))) : <Tafsir>[],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull": audioFull.toJson(),
        "ayat": List.from(ayat!.map((e) => e.toJson())),
        'tafsir': List.from(tafsir!.map((e) => e.toJson())),
      };
}

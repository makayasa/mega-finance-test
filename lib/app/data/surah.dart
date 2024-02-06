class Surah {
  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  AudioFull audioFull;

  Surah.empty()
      : nomor = 0,
        nama = '',
        namaLatin = '',
        jumlahAyat = 0,
        tempatTurun = '',
        arti = '',
        deskripsi = '',
        audioFull = AudioFull.empty();

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['namaLatin'],
        jumlahAyat: json['jumlahAyat'],
        tempatTurun: json['tempatTurun'],
        arti: json['arti'],
        deskripsi: json['deskripsi'],
        audioFull: AudioFull.fromJson(json['audioFull']),
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
      };
}

class AudioFull {
  AudioFull({
    required this.satu,
    required this.dua,
    required this.tiga,
    required this.empat,
    required this.lima,
  });
  String satu;
  String dua;
  String tiga;
  String empat;
  String lima;

  AudioFull.empty()
      : satu = '',
        dua = '',
        tiga = '',
        empat = '',
        lima = '';

  factory AudioFull.fromJson(Map<String, dynamic> json) => AudioFull(
        satu: json['01'],
        dua: json['02'],
        tiga: json['03'],
        empat: json['04'],
        lima: json['05'],
      );

  Map<String, dynamic> toJson() => {
        '01': satu,
        '02': dua,
        '03': tiga,
        '04': empat,
        '05': lima,
      };
}

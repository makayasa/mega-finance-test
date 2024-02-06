class Tafsir {
  Tafsir({
    required this.ayat,
    required this.teks,
  });
  int ayat;
  String teks;

  Tafsir.empty()
      : ayat = 0,
        teks = '';

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        ayat: json['ayat'],
        teks: json['teks'],
      );

  Map<String, dynamic> toJson() => {
        'ayat': ayat,
        'teks': teks,
      };
}

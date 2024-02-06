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

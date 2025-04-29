class Qurans {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;

  Qurans(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun});

  factory Qurans.fromJson(dynamic json) {
    return Qurans(
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['namaLatin'],
        jumlahAyat: json['jumlahAyat'],
        tempatTurun: json['tempatTurun']);
  }
}

class BukuModel {
  final int id;
  final String idBuku;
  final String judul;
  final String penulis;

  BukuModel({
    required this.id,
    required this.idBuku,
    required this.judul,
    required this.penulis,
  });

  factory BukuModel.fromJson(Map<String, dynamic> json) {
    return BukuModel(
      id: json['id'],
      idBuku: json['id_buku'],
      judul: json['judul_buku'],
      penulis: json['penulis'],
    );
  }
}
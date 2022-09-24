//SECTION Class Product
class ProductModel {
  //NOTE Constractor
  ProductModel({
    required this.id,
    required this.merkId,
    required this.namaProduct,
    required this.harga,
    required this.gambar,
    required this.spesifikasi,
    required this.rating,
    required this.status,
    required this.rekomendasi,
    required this.createdAt,
    required this.updatedAt,
    required this.merk,
  });

  //NOTE Atribute
  int id;
  String merkId;
  String namaProduct;
  String harga;
  String gambar;
  String spesifikasi;
  String rating;
  String status;
  String rekomendasi;
  DateTime createdAt;
  DateTime updatedAt;
  Merk merk;

  //NOTE  
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        //NOTE gunakan kondisi untuk ketika ada kondisi NULL = tidakNUll ?? NULL
        id: json["id"] ?? 0,
        merkId: json["merk_id"] ?? "",
        namaProduct: json["nama_product"] ?? "",
        harga: json["harga"] ?? "",
        gambar: json["gambar"] ??
            "https://syntop.sydemy.com/storage/product-images/5puVDfAAeLtiESGhHbFW5sjZoVW1ts27sp5fjg3K.webp",
        spesifikasi: json["spesifikasi"] ?? "",
        rating: json["rating"] ?? "",
        status: json["status"] ?? "",
        rekomendasi: json["rekomendasi"] ?? "",
        createdAt: DateTime.parse(
          json["created_at"] ?? DateTime.now().toIso8601String(),
        ),
        updatedAt: DateTime.parse(
          json["updated_at"] ?? DateTime.now().toIso8601String(),
        ),
        merk: Merk.fromJson(json["merk"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merk_id": merkId,
        "nama_product": namaProduct,
        "harga": harga,
        "gambar": gambar,
        "spesifikasi": spesifikasi,
        "rating": rating,
        "status": status,
        "rekomendasi": rekomendasi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "merk": merk.toJson(),
      };
}

//SECTION Class Merk
class Merk {
  Merk({
    required this.id,
    required this.merkProduct,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String merkProduct;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Merk.fromJson(Map<String, dynamic> json) => Merk(
        //NOTE gunakan kondisi untuk ketika ada kondisi NULL = tidakNUll ?? NULL
        id: json["id"] ?? 0,
        merkProduct: json["merk_product"] ?? "",
        status: json["status"] ?? "",
        createdAt: DateTime.parse(
          json["created_at"] ?? DateTime.now().toIso8601String(),
        ),
        updatedAt: DateTime.parse(
          json["updated_at"] ?? DateTime.now().toIso8601String(),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merk_product": merkProduct,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

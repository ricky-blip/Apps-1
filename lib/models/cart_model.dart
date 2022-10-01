class CartModel {
  CartModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.checkoutId,
    required this.jumlah,
    required this.totalharga,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.namaProduct,
    required this.gambar,
    required this.hargaSatuan,
    required this.merkProduct,
  });

  String id;
  String userId;
  String productId;
  dynamic checkoutId;
  String jumlah;
  String totalharga;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String namaProduct;
  String gambar;
  String hargaSatuan;
  String merkProduct;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        checkoutId: json["checkout_id"],
        jumlah: json["jumlah"],
        totalharga: json["totalharga"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        namaProduct: json["nama_product"],
        gambar: json["gambar"],
        hargaSatuan: json["harga_satuan"],
        merkProduct: json["merk_product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "checkout_id": checkoutId,
        "jumlah": jumlah,
        "totalharga": totalharga,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nama_product": namaProduct,
        "gambar": gambar,
        "harga_satuan": hargaSatuan,
        "merk_product": merkProduct,
      };
}

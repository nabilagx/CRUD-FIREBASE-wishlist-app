class WishlistItem {
  String id;
  String nama;
  int harga;
  String? alasan;

  WishlistItem({
    required this.id,
    required this.nama,
    required this.harga,
    this.alasan,
  });

  factory WishlistItem.fromMap(String id, Map<String, dynamic> data) {
    return WishlistItem(
      id: id,
      nama: data['nama'],
      harga: data['harga'],
      alasan: data['alasan'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'harga': harga,
      'alasan': alasan,
    };
  }
}
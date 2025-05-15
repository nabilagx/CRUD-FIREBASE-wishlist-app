import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/wishlist_item.dart';

class FirestoreService {
  final CollectionReference wishlistRef =
      FirebaseFirestore.instance.collection('wishlist');

  Stream<List<WishlistItem>> getWishlist() {
    return wishlistRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return WishlistItem.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> addItem(WishlistItem item) {
    return wishlistRef.add(item.toMap());
  }

  Future<void> updateItem(WishlistItem item) {
    return wishlistRef.doc(item.id).update(item.toMap());
  }

  Future<void> deleteItem(String id) {
    return wishlistRef.doc(id).delete();
  }
}

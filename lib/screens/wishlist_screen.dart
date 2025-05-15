import 'package:flutter/material.dart';
import '../models/wishlist_item.dart';
import '../services/firestore_service.dart';
import 'add_edit_screen.dart';

class WishlistScreen extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist Belanja')),
      body: StreamBuilder<List<WishlistItem>>(
        stream: firestoreService.getWishlist(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();

          final wishlist = snapshot.data ?? [];

          return ListView.builder(
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
              final item = wishlist[index];
              return ListTile(
                title: Text(item.nama),
                subtitle: Text('Rp${item.harga}\n${item.alasan ?? ''}'),
                isThreeLine: true,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddEditScreen(item: item),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        firestoreService.deleteItem(item.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddEditScreen(),
            ),
          );
        },
      ),
    );
  }
}

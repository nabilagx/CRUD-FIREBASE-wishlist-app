import 'package:flutter/material.dart';
import '../models/wishlist_item.dart';
import '../services/firestore_service.dart';

class AddEditScreen extends StatefulWidget {
  final WishlistItem? item;

  AddEditScreen({this.item});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final hargaController = TextEditingController();
  final alasanController = TextEditingController();

  final firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      namaController.text = widget.item!.nama;
      hargaController.text = widget.item!.harga.toString();
      alasanController.text = widget.item!.alasan ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.item != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Barang' : 'Tambah Barang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama Barang'),
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: hargaController,
                decoration: InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              TextFormField(
                controller: alasanController,
                decoration: InputDecoration(labelText: 'Alasan (opsional)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(isEditing ? 'Simpan Perubahan' : 'Tambah'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final item = WishlistItem(
                      id: isEditing ? widget.item!.id : '',
                      nama: namaController.text,
                      harga: int.parse(hargaController.text),
                      alasan: alasanController.text,
                    );
                    if (isEditing) {
                      firestoreService.updateItem(item);
                    } else {
                      firestoreService.addItem(item);
                    }
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

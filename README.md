# 📌 Wishlist App Nabila

Nama    : Nabila Choirunisa
Kelas   : PBM B
NIM     : 232410102059

Aplikasi Flutter sederhana yang mengimplementasikan fitur **CRUD (Create, Read, Update, Delete)** menggunakan **Firebase Firestore**.

## 🔧 Fitur
- Tambah wishlist baru
- Lihat daftar wishlist
- Edit wishlist
- Hapus wishlist

## ☁️ Integrasi Firebase

Aplikasi ini terhubung dengan **Firebase Firestore** menggunakan:
- `cloud_firestore` package
- File konfigurasi Firebase di `firebase_options.dart`

Firebase digunakan sebagai database cloud real-time untuk menyimpan data wishlist pengguna (tanpa login).

## 📸 Screenshot

### Halaman Daftar Wishlist
<img src="Documentation/list.jpeg" width="400"/>

### Form Tambah Wishlist
<img src="Documentation/tambah%20data.png" width="400"/>
<img src="Documentation/lihat%20hasil%20tambah%20data.png" width="400"/>

### Edit Wishlist
<img src="Documentation/edit.png" width="400"/>
<img src="Documentation/bukti%20edit.png" width="400"/>

### Hapus Wishlist
<img src="Documentation/berhasil%20hapus.png" width="400"/>


## 🛠️ Teknologi yang Digunakan
- Flutter
- Firebase Firestore (tanpa login)
![Firebase Firestore](Documentation/firebase1.png)
![Firebase Firestore](Documentation/firebase2.png)
![Firebase Firestore](Documentation/firebase3.png)
![Firebase Firestore](Documentation/firebase4.png)

## ▶️ Cara Menjalankan Aplikasi

```bash
flutter pub get
flutter run


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

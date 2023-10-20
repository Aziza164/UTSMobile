import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  //untuk menyediakan kerangka kerja dasar halaman dengan elemen-elemen seperti AppBar dan body
      appBar: AppBar( //untuk menampilkan judul halaman ("Cart") di bagian atas halaman
        title: Text('Cart'),
      ),
      body: Column( //widget yang mengatur elemen-elemen secara vertikal
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengiriman',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'JNE', // Ganti dengan metode pengiriman yang dipilih
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Alamat Pengiriman',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nama: Nurul Aziza Kusuma Dewi\n'
                  'Alamat: jln Joyo utomo dalam rt/rw:003, merjosari, lowokwaru, Malang Kota 65144, Jawa Timur\n'
                  'Nomor Telepon: +6281234567890',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'My Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded( //idget yang mengisi sebanyak mungkin ruang yang tersedia di dalam parent widget
              child: ListView(  //widget yang digunakan untuk menampilkan daftar item yang bisa di-scroll
                children: [
                CartItem( //widget khusus yang dibuat untuk menampilkan setiap item dalam keranjang
                  itemName: 'Jilbab Syari',
                  itemPrice: 'Rp40.000',
                  itemQuantity: 2,
                  itemRating: 5.5, // Tambahkan rating
                ),
                CartItem(
                  itemName: 'Bergo',
                  itemPrice: 'Rp29.900',
                  itemQuantity: 1,
                  itemRating: 5.5, // Tambahkan rating
                ),
                // Tambahkan item keranjang lainnya sesuai kebutuhan
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp69.900',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Ganti warna teks total
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(  //tombol yang digunakan untuk melakukan tindakan pembelian saat ditekan
              onPressed: () {
                // Aksi saat tombol "Beli" ditekan
              },
              child: Text(
                'Beli',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final int itemQuantity;
  final double itemRating;

  CartItem({
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemRating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(  //widget yang digunakan untuk mengelilingi item keranjang dan memberikan tampilan kartu pada setiap item
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(  //untuk menampilkan informasi item keranjang
        title: Text(
          itemName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: $itemPrice',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Quantity: $itemQuantity',
              style: TextStyle(fontSize: 14),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  itemRating.toStringAsFixed(1), // Menampilkan rating bintang
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton( //tombol dengan ikon yang digunakan untuk menghapus item dari keranjang saat ditekan
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            // Aksi saat tombol hapus ditekan
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Product_ListPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  //kerangka kerja dasar yang menyediakan elemen-elemen UI seperti AppBar dan body
      appBar: AppBar( //untuk menampilkan bilah atas halaman profil
        title: Text('My Jilbab Store'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(  //untuk mengizinkan konten di dalamnya di-scroll ketika ukurannya lebih besar dari layar
        child: Column(  //widget yang mengatur elemen-elemen secara vertikal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(  //ntuk menumpuk beberapa widget di atas satu sama lain
              children: [
                Container(  //widget yang digunakan untuk mengatur tampilan kontainer dengan properti
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2019/11/02/121684/tapaki-kesejukan-di-5-pantai-pasuruan-yang-menyenangkan-1911023.jpg', // Ganti dengan URL gambar latar belakang toko
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 140.0),
                      CircleAvatar( //digunakan untuk menampilkan foto profil dengan bentuk lingkaran
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://diary.marshabeauty.com/media/assets/1681809383.jpg',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text( //untuk menampilkan teks
                        'Nurul Aziza Kusuma Dewi',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'azizanurul017@gmail.com',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(  //untuk menambahkan jarak (padding) di sekitar elemen-elemen di dalamnya
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About My Store',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Nurul Aziza Kusuma Dewi\'s Jilbab Store. We offer a wide range of high-quality jilbabs in various styles and colors.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Product Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap( //widget yang mengatur elemen-elemen secara horizontal
                    spacing: 8.0,
                    children: [
                      Chip( //widget yang digunakan untuk menampilkan label kategori produk
                        label: Text('Plain Jilbabs'),
                      ),
                      Chip(
                        label: Text('Printed Jilbabs'),
                      ),
                      Chip(
                        label: Text('Hijab Accessories'),
                      ),
                      Chip(
                        label: Text('Special Occasion Jilbabs'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Latest Products Jilbab',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Tambahkan daftar produk terbaru di sini
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: productList.map((product) {
                      return ListTile(  //untuk menampilkan daftar produk terbaru dalam bentuk daftar
                        leading: Image.network( //ntuk menampilkan gambar produk dari URL yang disediakan
                          product.image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp ${product.price}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text(product.rating.toString()),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

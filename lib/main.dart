import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/ProfilePage.dart'; // Ganti sesuai dengan lokasi file ProfilePage
import 'package:flutter_application_1/Product_ListPage.dart';
import 'package:flutter_application_1/detailpage.dart'; // Impor DetailPage

void main() {   //titik masuk utama aplikasi Flutter
  runApp(MyApp());    //kelas utama aplikasi yang mewarisi dari StatelessWidget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jual Hijab App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {   //kelas yang mewarisi dari StatefulWidget
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {    //kelas private yang mewarisi dari State<MyHomePage>
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ProductListPage(),
    ProfilePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(    //kerangka kerja dasar yang digunakan untuk membangun antarmuka pengguna dalam Flutter
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(   //widget yang digunakan untuk membuat bilah navigasi di bagian bawah layar
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Profile', // Ubah label ke "Profile"
            icon: Icon(Icons.person), // Gunakan ikon "person" untuk profil
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
void navigateToDetailPage(BuildContext context, Product product) {
  Navigator.push( //untuk mengelola perpindahan antara berbagai halaman dalam aplikasi
    context,
    MaterialPageRoute(
      builder: (context) => DetailPage(product: product),
    ),
  );
}

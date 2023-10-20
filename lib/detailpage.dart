import 'package:flutter/material.dart';
import 'package:flutter_application_1/Product_ListPage.dart';

class DetailPage extends StatelessWidget {  //untuk membuat halaman detail produk
  final Product product;

  DetailPage({required this.product});  //menerima objek Product yang akan digunakan untuk menampilkan detail produk pada halaman

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // kerangka kerja dasar yang digunakan untuk membangun halaman
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(  //untuk menempatkan elemen-elemen secara tumpuk
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), //untuk memberikan sedikit jarak (spasi) vertikal antara elemen-elemen di dalam Column
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 20.0), 
            Center(
              child: Text(
                'Additional Information:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column( // untuk mengatur elemen-elemen dalam tata letak horizontal (dari kiri ke kanan)
                  children: <Widget>[
                    Icon(Icons.calendar_today_rounded),
                    Text('Open Everyday'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    Text('09.00 - 20.30'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.monetization_on),
                    Text(
                      'Rp ${product.price}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
             SizedBox(height: 20.0), 
            SizedBox(height: 8.0),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( //yang diwakili oleh ikon keranjang belanja.
        onPressed: () {
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

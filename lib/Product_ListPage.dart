import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action here
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return ProductGridItem(product: product);
        },
      ),
    );
  }
}

  class ProductGridItem extends StatelessWidget { //digunakan untuk menampilkan setiap produk dalam grid
  final Product product;

  ProductGridItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell( //widget yang memberikan efek interaktif ketika pengguna mengetuk item produk
      onTap: () {
        navigateToDetailPage(context, product);
      },
      child: Card(  //untuk membuat kartu yang mengandung informasi produk, termasuk gambar, nama, harga, rating, dan deskripsi produk.
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(  //untuk mengatur elemen-elemen dalam tumpukan
              alignment: Alignment.topRight, // Membuat ikon keranjang di atas kanan gambar produk
              children: [
                Image.network(  //widget yang digunakan untuk menampilkan gambar produk dari URL yang diberikan.
                  product.image,
                  height: 50.0, // Mengubah ukuran gambar menjadi lebih besar
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                IconButton( //tombol ikon yang digunakan untuk menambahkan produk ke keranjang 
                  icon: Icon(Icons.shopping_cart, color: Colors.red),
                  onPressed: () {
                    // Tambahkan logika ketika keranjang ditekan (misalnya, menambahkan produk ke keranjang)
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Rp ${product.price}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow),
                    Text(product.rating.toString()),
                  ],
                ),
                Icon(Icons.favorite_border), // Ikon favorit (atau sesuaikan dengan yang Anda butuhkan)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Product { //digunakan untuk mendefinisikan atribut-atribut produk
  final String id;
  final String name;
  final String image;
  final String price; 
  final double rating;
  final String description;

  Product({ //daftar produk yang akan ditampilkan dalam halaman "Product List"
    required this.id,
    required this.name,
    required this.image,
    required this.price, 
    required this.rating,
    required this.description,
  });
}

List<Product> productList = [
  Product(
    id: '1',
    name: 'Bella square',
    image: 'https://media.karousell.com/media/photos/products/2023/2/21/kerudung_bella_square_1676971317_222e2aeb_progressive.jpg',
    price: '15.000', 
    rating: 5.5,
    description: 'Jilbab Bella square terbuat dari bahan double hycon dan yang pastinya 100% terbuat dari katun yang menjadikan bahan ini.'
        'Adem dan menyerap keringat. Jilbab Bella Square menggunakan bahan yang mudah dibentuk, jatuh, dan tidak licin.',
  ),
  Product(
    id: '2',
    name: 'Jilbab Pashmina',
    image: 'https://lzd-img-global.slatic.net/g/p/3e979b87df7aeaa18bc143c01b968b64.jpg_720x720q80.jpg_.webp',
    price: '35.000', 
    rating: 5.5,
    description: 'Jenis wol kashmir sempurna dan tekstil yang terbuat dari wol tersebut dan pertama kali ditenun di India'
    'Bahan utama dari Jilbab Pashmina adalah bahan yang lembut, ringan, dan nyaman seperti katun, chiffon, atau bahan-bahan campuran lainnya.',
  ),
  Product(
    id: '3',
    name: 'Hijab Crinkle',
    image: 'https://images.tokopedia.net/img/cache/100-square/product-1/2020/2/6/644125075/644125075_a3856c68-11c4-4954-b7a4-31fccdfae9ed_640_640.jpg.webp?ect=4g',
    price: '27.900',
    rating: 5.5,
    description: 'Hijab Crinkle adalah jenis jilbab atau hijab yang terbuat dari bahan kain bernama crinkle atau krep.' 
    ' Kain crinkle memiliki tekstur berkerut yang unik dan memberikan tampilan yang kasual, anggun, dan tidak perlu disetrika.'
    ' Hijab Crinkle sering kali digemari karena kainnya yang ringan, mudah diatur, dan nyaman dipakai.',
  ),
    Product(
    id: '4',
    name: 'Hijab Bawal Instan',
    image: 'https://images.tokopedia.net/img/cache/100-square/VqbcmM/2023/4/8/b574bb97-2777-4ed1-9beb-8fad14fa8509.jpg.webp?ect=4g',
    price: '50.000', 
    rating: 5.5,
    description: 'Hijab bawal instan adalah jenis jilbab atau hijab yang terbuat dari bahan yang ringan dan mudah dipakai tanpa perlu banyak peraturan lipatan.'
    ' Biasanya, hijab ini memiliki bentuk segiempat dengan satu bagian yang sudah dijahit atau dilengkapi dengan peniti, sehingga cukup diletakkan di kepala dan diatur sedikit untuk menciptakan penampilan yang rapi.',
  ),
      Product(
    id: '5',
    name: 'Kerudung Wideshwal',
    image: 'https://ae01.alicdn.com/kf/S8f9e88f1f0f246e3947347e37f271a37A/175X70CM-Syal-Jersey-Bergaris-Hijab-Muslim-Hijab-Syal-Kepala-Wanita-Malaysia-Polos-Kerudung-WIDESHAWL-INSTOCK.jpg_220x220.jpg_.webp',
    price: '45.000', 
    rating: 5.5,
    description: 'Bahan yang umumnya digunakan untuk Wideshawl adalah bahan ringan, seperti chiffon atau katun jepang, yang memungkinkan kerudung ini memiliki lipatan yang indah dan mudah diatur.'
    ' Kelebaran Wideshawl membuatnya cocok untuk berbagai gaya pemakaian, termasuk gaya simpel dan juga gaya lebih kreatif yang melibatkan banyak drapery.',
  ),
    Product(
    id: '6',
    name: 'Hijab Sporty Olahraga',
    image: 'https://down-id.img.susercontent.com/file/id-11134207-7qul5-lfpdm5979vaa19',
    price: '20.000', 
    rating: 5.5,
    description: 'Bahan jilbab sporty seringkali ringan agar pengguna dapat bergerak dengan mudah dan merasa nyaman selama berolahraga.'
    ' Berkualitas tinggi sering kali terbuat dari kain berkualitas tinggi yang menawarkan kelembutan, daya serap keringat, dan ketahanan terhadap aktivitas fisik',
  ),
    Product(
    id: '7',
    name: 'Maula Hijab',
    image: 'https://cf.shopee.co.id/file/96af7e476c2290c0638dd35f1897079a',
    price: '39.060', 
    rating: 5.5,
    description: 'Jilbab Maula sering terbuat dari bahan katun, viscose, atau bahan lain yang ringan, nyaman, dan memiliki daya serap keringat yang baik. Ini membuatnya cocok untuk dipakai sehari-hari, terutama dalam iklim yang hangat..',
  ),
      Product(
    id: '8',
    name: 'Kerudung Salwa Malay Khimar',
    image: 'https://lzd-img-global.slatic.net/g/shop/475bc85a833068476408debca50d834b.png_2200x2200q80.png_.webp',
    price: '40.700', 
    rating: 5.5,
    description: 'Bahan yang digunakan untuk kerudung ini mungkin bervariasi tergantung pada merek dan produsen,'
    'tetapi biasanya mereka terbuat dari bahan yang ringan, seperti katun atau chiffon.'
    ' Kerudung Malay Khimar biasanya memiliki desain yang longgar dan nyaman untuk dipakai sehari-hari, dengan ukuran yang cukup besar untuk menutupi seluruh tubuh kecuali wajah dan tangan.',
  ),



  // Tambahkan produk lainnya sesuai kebutuhan
];

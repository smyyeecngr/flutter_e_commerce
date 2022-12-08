import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/components/header.dart';
import 'package:flutter_ecommerce/productDetail.dart';

import 'components/bottomNavigation.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Surface laptop 3",
      "fotograf": "assets/images/laptop.jpg",
      "fiyat": "24.000 ₺"
    },
    {
      "isim": "Casper Nirvana",
      "fotograf": "assets/images/caspernirvana.jpg",
      "fiyat": "27.000 ₺"
    },
    {
      "isim": "Macbook Pro",
      "fotograf": "assets/images/macbookpro.jpg",
      "fiyat": "32.000 ₺"
    },
    {
      "isim": "Asus Laptop",
      "fotograf": "assets/images/asuslaptop.jpg",
      "fiyat": "25.700 ₺"
    },
    {
      "isim": "Lenovo Laptop",
      "fotograf": "assets/images/lenovo.jpg",
      "fiyat": "25.500 ₺"
    },
    {
      "isim": "Dell Laptop",
      "fotograf": "assets/images/dell.jpg",
      "fiyat": "26.850 ₺"
    },
    {
      "isim": "Dell Laptop",
      "fotograf": "assets/images/dell.jpg",
      "fiyat": "26.850 ₺"
    },
    {
      "isim": "Dell Laptop",
      "fotograf": "assets/images/dell.jpg",
      "fiyat": "26.850 ₺"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //HEADER
          header(categoryTitle, context),
          SizedBox(height: 30),

          //İÇERİKLER
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              children: products.map((Map product) {
                return buildContent(product["isim"], product["fotograf"],
                    product["fiyat"], context);
              }).toList(),
            ),
          )
        ]),
      ),
      //bottomnavigation
      bottomNavigationBar("search"),
    ])));
  }

  Widget buildContent(String title, String photourl, String price, context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductDetailPage(title);
          }));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 24,
                  offset: Offset(0, 16))
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 16),
              Image.asset(photourl),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF0A1034),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    " $price",
                    style: TextStyle(
                      color: Color(0xFF1F53E4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

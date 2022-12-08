import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/categories.dart';
import 'package:flutter_ecommerce/components/bottomNavigation.dart';
import 'package:flutter_ecommerce/components/label.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                // BASLIK
                buildBaslik(),

                // BANNER
                buildBanner(),

                // BUTONLAR
                Padding(
                  padding: EdgeInsets.only(top: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //ilk eleman
                      buildNavigation(
                        text: "Kategoriler",
                        icon: Icons.menu,
                        widget: CategoriesPage(),
                        context: context,
                      ),
                      buildNavigation(
                          text: "Favoriler", icon: Icons.star_border),
                      buildNavigation(
                          text: "Hediyeler", icon: Icons.card_giftcard),
                      buildNavigation(
                          text: "En İyi Satıcılar", icon: Icons.people),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // SALES
                Text(
                  "Ürünler",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF0A1034)),
                ),
                SizedBox(height: 16),

                // SALES ITEMS

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSalesItem(
                      text: "Akıllı Telefonlar",
                      photourl: "assets/images/smartphone.png",
                      discount: "-50%",
                      screenWidth: screenWidth,
                    ),
                    buildSalesItem(
                      text: "Monitörler",
                      photourl: "assets/images/monitor.jpg",
                      discount: "-50%",
                      screenWidth: screenWidth,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSalesItem(
                      text: "Televizyonlar",
                      photourl: "assets/images/television.jpeg",
                      discount: "-50%",
                      screenWidth: screenWidth,
                    ),
                    buildSalesItem(
                      text: "Mutfak Aletleri",
                      photourl: "assets/images/home.jpg",
                      discount: "-50%",
                      screenWidth: screenWidth,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //BOTTOM NAVİGATİON BAR
          bottomNavigationBar("home"),
        ],
      ),
    ));
  }
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Dijital Market",
      style: TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBanner() {
  return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
          decoration: BoxDecoration(
              color: Color(0xFF4169e1), borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Iphone 11 Pro Max",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "22.000 ₺",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Image.asset("assets/images/iphone11promax.jpg"),
            ],
          )));
}

Widget buildNavigation({
  required String text,
  required IconData icon,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE0ECF8)),
          child: Icon(
            icon,
            color: Color(0xFF1F53E4),
            size: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF1F53E4),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget buildSalesItem({
  required String text,
  required String photourl,
  required String discount,
  required double screenWidth,
}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),
        SizedBox(height: 22),
        Image.asset(photourl),
        SizedBox(height: 22),
        Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
          ),
        ),
      ],
    ),
  );
}

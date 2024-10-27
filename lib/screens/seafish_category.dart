import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/utils/header.dart';
import 'package:ecommerce_site/utils/header_category_list.dart';
import 'package:ecommerce_site/utils/left_drawer.dart';
import 'package:ecommerce_site/utils/right_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SeafishCategory extends StatefulWidget {
  const SeafishCategory({super.key});

  @override
  State<SeafishCategory> createState() => _SeafishCategoryState();
}

class _SeafishCategoryState extends State<SeafishCategory> {
  double devHeight = 0.0, devWidth = 0.0;
  GlobalKey<ScaffoldState> key = GlobalKey();
  ScrollController scrollcontroller = ScrollController();
  int index = 0;
  List<String> items = [
    "Seer Fish / Vanjaram / Nei Meen:Net Weight: 500 - 480 gms:Start from ₹349.00",
    "Sankara / Pink Perch: Net Weight: 340 - 390 gms:Start from ₹279.00",
    "Blue Crab / Nandu ( Cleaned ):Net Weight: 280 - 360 gms:₹319.00",
    "Thenga Paarai / Trevally Fish:Net Weight: 350 - 450 gms:Start from ₹419.00",
    "Tuna / Soorai (Includes Head & Tail):Net Weight: 550 - 780 gms:Start from ₹299.00",
    "Vilaimeen / Emperor Medium slices: Net Weight: 500-550gms:₹529.00",
    "Vilaimeen / Emperor cubes:Net Weight: 500-550gms:₹499.00",
    "Silver Belly / KaraPodi ( Cleaned ):Net Weight: 300 - 350 Gms:Start from ₹149.00",
    "Emperor / Vilaimeen:Net Weight: 490 - 350 gms:Start from ₹259.00",
    "Shark:Net Weight: 480 - 510 gms:Start from ₹519.00",
    "Squid / kanavai / kadamba:Net Weight: 240 - 270 gms:Start from ₹219.00",
    "Red Snapper:Net Weight: 450 - 550 gms:Start from ₹489.00",
    "Udaan:Net Weight: 330 - 420 gms:Start from ₹239.00",
    "Navarai:Net Weight: 330 - 420 gms:Start from ₹219.00",
    "Grouper Cubes (Skinless & Boneless): Net Weight: 480 - 520 gms:₹529.00"
  ];
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: key,
      drawer: LeftDrawer(devHeight: devHeight, devWidth: devWidth),
      endDrawer: RightDrawer(key2: key),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(devHeight: devHeight, devWidth: devWidth, key2: key),
            // programmatical Listview
            SizedBox(height: devHeight * 0.01),
            HeaderCategoryList(
                devHeight: devHeight,
                devWidth: devWidth,
                scrollcontroller: scrollcontroller),
            SizedBox(height: devHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sea Fish'.toUpperCase(),
                      style: TextStyle(
                          color: Palette.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                  SizedBox(height: devHeight * 0.02),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: devHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: devWidth * 0.03),
                    child: Wrap(
                        spacing: devWidth * 0.01,
                        runSpacing: devHeight * 0.02,
                        children: items.map((item) {
                          String text = item.split(":")[0];
                          String weight =
                              item.split(":")[1] + ":" + item.split(":")[2];
                          String price = item.split(":")[3];
                          index++;
                          String imgPath = "seafish$index";
                          return category(
                              text: text,
                              weight: weight,
                              imgPath: imgPath,
                              price: price);
                        }).toList()),
                  ),
                  SizedBox(height: devHeight * 0.1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget category(
      {required String text,
      required String imgPath,
      required String weight,
      required String price}) {
    return SizedBox(
      height: devHeight * 0.65,
      width: devWidth * 0.27,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: devHeight * 0.4,
              // width: devWidth * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage('images/seaFishCategory/$imgPath.jpg'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: devHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: TextStyle(fontWeight: FontWeight.w400)),
                  SizedBox(height: devHeight * 0.02),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined, size: 18),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(23, 162, 184, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 5, bottom: 5),
                          child: Text(weight,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: devHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price,
                          style: TextStyle(color: Colors.red, fontSize: 18)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.only(
                                  left: devWidth * 0.008,
                                  right: devWidth * 0.008),
                              backgroundColor: Color.fromRGBO(255, 193, 7, 1),
                              foregroundColor: Colors.black),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart),
                              Text('Customize')
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: devHeight * 0.03),
          ],
        ),
      ),
    );
  }
}

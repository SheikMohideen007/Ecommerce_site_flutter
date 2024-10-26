import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/utils/header.dart';
import 'package:ecommerce_site/utils/header_category_list.dart';
import 'package:ecommerce_site/utils/left_drawer.dart';
import 'package:ecommerce_site/utils/right_drawer.dart';
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
                  Row(
                    children: [
                      category(),
                    ],
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

  Widget category() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: devHeight * 0.4,
            width: devWidth * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                image: DecorationImage(
                    image: AssetImage('images/category2/img11.jpg'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: devHeight * 0.02),
          Text('Seer Fish / Vanjaram / Nei Meen',
              style: TextStyle(fontWeight: FontWeight.w400)),
          SizedBox(height: devHeight * 0.02),
          Row(
            children: [
              Icon(Icons.shopping_bag_outlined, size: 18),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(23, 162, 184, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text('Net Weight: 500 - 480 gms',
                      style: TextStyle(color: Colors.white, fontSize: 8)),
                ),
              )
            ],
          ),
          SizedBox(height: devHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Start from ₹349.00',
                  style: TextStyle(color: Colors.red, fontSize: 18)),
              SizedBox(width: devWidth * 0.03),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.only(
                          left: devWidth * 0.008, right: devWidth * 0.008),
                      backgroundColor: Color.fromRGBO(255, 193, 7, 1),
                      foregroundColor: Colors.black),
                  onPressed: () {},
                  child: Row(
                    children: [Icon(Icons.shopping_cart), Text('Customize')],
                  ))
            ],
          ),
          SizedBox(height: devHeight * 0.03),
        ],
      ),
    );
  }
}

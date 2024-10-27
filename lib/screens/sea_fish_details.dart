import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/utils/header.dart';
import 'package:ecommerce_site/utils/header_category_list.dart';
import 'package:ecommerce_site/utils/left_drawer.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../utils/right_drawer.dart';

class SeaFishDetails extends StatefulWidget {
  const SeaFishDetails({super.key});

  @override
  State<SeaFishDetails> createState() => _SeaFishDetailsState();
}

class _SeaFishDetailsState extends State<SeaFishDetails> {
  double devHeight = 0.0, devWidth = 0.0;
  GlobalKey<ScaffoldState> key = GlobalKey();
  ScrollController scrollcontroller = ScrollController();
  int index = 0;
  List<String> sampleImages = [
    'images/seaFishCategory/food1.jpg',
    'images/seaFishCategory/food2.jpg',
    'images/seaFishCategory/food3.jpg',
    'images/seaFishCategory/food4.jpg'
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Header(devHeight: devHeight, devWidth: devWidth, key2: key),
              // programmatical Listview
              SizedBox(height: devHeight * 0.01),
              HeaderCategoryList(
                  devHeight: devHeight,
                  devWidth: devWidth,
                  scrollcontroller: scrollcontroller),
              SizedBox(height: devHeight * 0.08),
              Container(
                width: devWidth * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: devWidth * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: devHeight * 0.02),
                          Text('Seer Fish / Vanjaram / Nei Meen',
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: devHeight * 0.02),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: FanCarouselImageSlider.sliderType2(
                              imagesLink: sampleImages,
                              isAssets: true,
                              autoPlay: false,
                              sliderHeight: 300,
                              sliderWidth: devWidth * 0.33,
                              currentItemShadow: const [
                                BoxShadow(
                                    offset: Offset(1, 1),
                                    color: Color.fromARGB(1, 1, 1, 1),
                                    blurRadius: 10)
                              ],
                              sideItemsShadow: [
                                BoxShadow(
                                    offset: Offset(1, 1),
                                    color: Color.fromARGB(1, 1, 1, 1),
                                    blurRadius: 10)
                              ],
                              sliderDuration: const Duration(milliseconds: 200),
                              imageRadius: 10,
                              slideViewportFraction: 1.5,
                              indicatorActiveColor: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: devHeight * 0.05),
                      child: Container(
                        width: devWidth * 0.43,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: devHeight * 0.02),
                            Text('Available Products',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: devHeight * 0.02),
                            availableStock(
                                name: 'Seer / Vanjaram Large Full Slice',
                                price: '799.00',
                                imgPath: 'food1'),
                            availableStock(
                                name: 'Seer / Vanjaram curry Cut',
                                price: '769.00',
                                imgPath: 'food2'),
                            availableStock(
                                name: 'Seer / Vanjaram Medium Full Slice',
                                price: '869.00',
                                imgPath: 'food3'),
                            availableStock(
                                name: 'Seer / Vanjaram Head',
                                price: '900.00',
                                imgPath: 'food4'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }

  Padding availableStock(
      {required String name, required String price, required imgPath}) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: EdgeInsets.only(
              top: devHeight * 0.008,
              left: devWidth * 0.01,
              bottom: devHeight * 0.02),
          child: Row(
            children: [
              SizedBox(
                  height: devHeight * 0.2,
                  width: devWidth * 0.15,
                  child: Image.asset('images/seaFishCategory/$imgPath.jpg',
                      fit: BoxFit.fill)),
              SizedBox(width: devWidth * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  SizedBox(height: devHeight * 0.01),
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
                          child: Text('Net Weight: 480 - 520 gms',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: devHeight * 0.01),
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
                          child: Text('No Of Peices: 3 - 6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: devHeight * 0.01),
                  Text('₹$price',
                      style: TextStyle(color: Colors.red, fontSize: 18)),
                  SizedBox(height: devHeight * 0.01),
                  Text('In stock',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: devHeight * 0.02),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: Palette.primaryColor,
                          padding: EdgeInsets.only(left: 5, right: 5)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text('Add to cart',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10))
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/utils/header.dart';
import 'package:ecommerce_site/utils/header_category_list.dart';
import 'package:ecommerce_site/utils/left_drawer.dart';
import 'package:ecommerce_site/utils/right_drawer.dart';
import 'package:ecommerce_site/utils/shop_by_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            // image slider
            Carousel(
              autoScroll: true,
              autoScrollDuration: Duration(seconds: 2),
              height: devHeight * 0.5,
              activateIndicatorColor: Palette.primaryColor,
              indicatorBarColor: Colors.transparent,
              unActivatedIndicatorColor: Colors.white,
              items: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
                  child: SizedBox(
                      height: devHeight,
                      width: devWidth,
                      child: Image.asset(
                        'images/image_slider1.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
                  child: SizedBox(
                      height: devHeight,
                      width: devWidth,
                      child: Image.asset(
                        'images/image_slider2.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
                  child: SizedBox(
                      height: devHeight,
                      width: devWidth,
                      child: Image.asset(
                        'images/image_slider3.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
            SizedBox(height: devHeight * 0.05),
            ShopByCategory(),
            SizedBox(height: devHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
              child: Image.asset('images/freshma-images.png'),
            ),
            SizedBox(height: devHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
              child: Image.asset('images/images3freshma.png'),
            ),
            SizedBox(height: devHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
              child: Image.asset('images/images4freshma.jpg'),
            ),
            SizedBox(height: devHeight * 0.05),
          ],
        ),
      ),
    );
  }
}

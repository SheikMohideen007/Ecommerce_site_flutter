import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/utils/header.dart';
import 'package:ecommerce_site/utils/left_drawer.dart';
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
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: key,
      drawer: LeftDrawer(devHeight: devHeight, devWidth: devWidth),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(devHeight: devHeight, devWidth: devWidth, key2: key),
            // programmatical Listview
            SizedBox(
              height: devHeight * 0.2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
                    child: ListView.builder(
                      itemCount: 30,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        int currInd = (index % 10) + 1;
                        return Container(
                            width: devWidth * 0.15,
                            child: Image.asset(
                                'images/category/img$currInd${currInd == 9 ? '.png' : '.jpg'}'));
                      },
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Palette.secondaryColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.arrow_back_ios),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Palette.secondaryColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            )
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/utils/header.dart';
import 'package:ecommerce_site/utils/left_drawer.dart';
import 'package:ecommerce_site/utils/right_drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileScreen> {
  double devHeight = 0.0, devWidth = 0.0;
  GlobalKey<ScaffoldState> key = GlobalKey();
  ScrollController scrollcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: key,
        backgroundColor: Colors.grey.shade100,
        drawer: LeftDrawer(devHeight: devHeight, devWidth: devWidth),
        endDrawer: RightDrawer(key2: key),
        body: SingleChildScrollView(
            child: Column(children: [
          Header(devHeight: devHeight, devWidth: devWidth, key2: key),
          Container(
            height: devHeight * 0.25,
            width: devWidth,
            color: Colors.grey.shade200,
            child: Padding(
              padding:
                  EdgeInsets.only(left: devWidth * 0.1, top: devHeight * 0.08),
              child: Text('My Profile',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // color: Palette.secondaryColor
                      color: Colors.black)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: devHeight * 0.1, horizontal: devWidth * 0.05),
            child: SizedBox(
              height: devHeight * 0.8,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(children: [])),
                  ),
                  SizedBox(
                    width: devWidth * 0.02,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: devWidth * 0.02,
                              vertical: devHeight * 0.05),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Update Account Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22))
                              ]),
                        )),
                  )
                ],
              ),
            ),
          )
        ])));
  }
}

import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.devHeight,
    required this.devWidth,
    required this.key2,
  });

  final double devHeight;
  final double devWidth;
  final GlobalKey<ScaffoldState> key2;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: widget.devHeight * 0.03,
            horizontal: widget.devWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: widget.devWidth * 0.15,
                child: Image.asset('images/logo1.png')),
            SizedBox(
              width: widget.devWidth * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.key2.currentState!.openEndDrawer();
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Palette.secondaryColor),
                          Padding(
                            padding:
                                EdgeInsets.only(left: widget.devWidth * 0.005),
                            child: Text('Search',
                                style:
                                    TextStyle(color: Palette.secondaryColor)),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        children: [
                          Icon(Icons.account_circle_rounded,
                              color: Palette.secondaryColor),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: widget.devWidth * 0.005),
                              child: Text('Login',
                                  style: TextStyle(
                                      color: Palette.secondaryColor))),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Palette.secondaryColor,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: widget.devWidth * 0.005),
                              child: Text('Cart',
                                  style: TextStyle(
                                      color: Palette.secondaryColor))),
                          Padding(
                            padding:
                                EdgeInsets.only(left: widget.devWidth * 0.005),
                            child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Center(child: Text('3'))),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.key2.currentState!.openDrawer();
                      },
                      icon: Icon(Icons.menu,
                          size: 35, color: Palette.secondaryColor))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:flutter/material.dart';

class HeaderCategoryList extends StatelessWidget {
  const HeaderCategoryList({
    super.key,
    required this.devHeight,
    required this.devWidth,
    required this.scrollcontroller,
  });

  final double devHeight;
  final double devWidth;
  final ScrollController scrollcontroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: devHeight * 0.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: devWidth * 0.02),
            child: ListView.builder(
              itemCount: 30,
              scrollDirection: Axis.horizontal,
              controller: scrollcontroller,
              itemBuilder: (context, index) {
                int currInd = (index % 10) + 1;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.005),
                  child: Container(
                    width: devWidth * 0.08,
                    height: devHeight * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Palette.primaryColor),
                        image: DecorationImage(
                            image: AssetImage(
                                'images/category/img$currInd${currInd == 9 ? '.png' : '.jpg'}'))),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Palette.secondaryColor, shape: BoxShape.circle),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      scrollcontroller.animateTo(scrollcontroller.offset - 100,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
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
                  color: Palette.secondaryColor, shape: BoxShape.circle),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      scrollcontroller.animateTo(scrollcontroller.offset + 100,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    icon: Icon(Icons.arrow_forward_ios)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

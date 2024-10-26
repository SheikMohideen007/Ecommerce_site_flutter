import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/screens/seafish_category.dart';
import 'package:flutter/material.dart';

class ShopByCategory extends StatefulWidget {
  const ShopByCategory({
    super.key,
  });

  @override
  State<ShopByCategory> createState() => _ShopByCategoryState();
}

class _ShopByCategoryState extends State<ShopByCategory> {
  double devHeight = 0.0, devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: devWidth * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shop By Category'.toUpperCase(),
              style: TextStyle(color: Palette.primaryColor, fontSize: 27)),
          SizedBox(height: devHeight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              categoryCard(
                  text: 'Sea Fish',
                  imgPath: 'img11',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeafishCategory()));
                  }),
              categoryCard(
                  text: 'Fillets & Slices',
                  imgPath: 'fillets&slice',
                  onTap: () {}),
              categoryCard(
                  text: 'Today Deals', imgPath: 'todayDeals', onTap: () {}),
              categoryCard(
                  text: 'Freshwater Fish',
                  imgPath: 'freshwaterfish',
                  onTap: () {}),
            ],
          ),
          SizedBox(height: devHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              categoryCard(text: 'lobster', imgPath: 'lobster', onTap: () {}),
              categoryCard(text: 'Crabs', imgPath: 'crabs', onTap: () {}),
              categoryCard(text: 'prawns', imgPath: 'prawns', onTap: () {}),
              categoryCard(text: 'dryfish', imgPath: 'dryfish', onTap: () {}),
            ],
          ),
          SizedBox(height: devHeight * 0.02),
          Row(
            children: [
              categoryCard(text: 'Combos', imgPath: 'combos', onTap: () {}),
              SizedBox(width: devWidth * 0.02),
              categoryCard(
                  text: 'nutri picks', imgPath: 'nutripicks', onTap: () {}),
            ],
          ),
          SizedBox(height: devHeight * 0.1),
        ],
      ),
    );
  }

  Widget categoryCard(
      {required String text,
      required String imgPath,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Container(
                height: devHeight * 0.35,
                width: devWidth * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage('images/category2/$imgPath.jpg'),
                        fit: BoxFit.cover)),
              ),
              Text(text.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}

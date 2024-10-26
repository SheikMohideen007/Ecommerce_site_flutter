import 'package:flutter/material.dart';

class RightDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> key2;
  const RightDrawer({super.key, required this.key2});

  @override
  State<RightDrawer> createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {
  double devHeight = 0.0, devWidth = 0.0;
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: devHeight * 0.1,
            color: Colors.grey.shade200,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: devWidth * 0.005),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search', style: TextStyle(fontSize: 20)),
                  IconButton(
                      onPressed: () {
                        widget.key2.currentState!.closeEndDrawer();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
            ),
          ),
          SizedBox(height: devHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: devWidth * 0.005),
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search Product',
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.blue)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

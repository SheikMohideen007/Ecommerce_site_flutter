import 'package:ecommerce_site/constants/color_palette.dart';
import 'package:ecommerce_site/screens/home.dart';
import 'package:ecommerce_site/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({
    super.key,
    required this.devHeight,
    required this.devWidth,
  });

  final double devHeight;
  final double devWidth;

  @override
  State<LeftDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<LeftDrawer> {
  double devHeight = 0.0, devWidth = 0.0;
  List<bool> isHover = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          Container(
            height: widget.devHeight * 0.1,
            width: widget.devWidth,
            decoration: BoxDecoration(color: Palette.primaryColor),
            child: Padding(
              padding: EdgeInsets.only(
                  top: widget.devHeight * 0.03, left: widget.devWidth * 0.02),
              child: Text('Freshma',
                  style: TextStyle(
                      color: Palette.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          sideMenus(
              icon: Icon(Icons.home, color: Colors.grey.shade700),
              text: 'Home',
              onTap: () {
                setState(() {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                });
                Navigator.pop(context);
              },
              val: isHover[0],
              onHover: (hover) {
                // print(hover);
                setState(() {
                  isHover[0] = true;
                });
              },
              onExit: (exit) {
                setState(() {
                  isHover[0] = false;
                });
              }),
          sideMenus(
              icon: Icon(Icons.menu_book, color: Colors.grey.shade700),
              text: 'My Orders',
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
              val: isHover[1],
              onHover: (hover) {
                // print(hover);
                setState(() {
                  isHover[1] = true;
                });
              },
              onExit: (exit) {
                setState(() {
                  isHover[1] = false;
                });
              }),
          sideMenus(
              icon: Icon(Icons.account_circle_outlined,
                  color: Colors.grey.shade700),
              text: 'My Profile',
              onTap: () {
                setState(() {});
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              val: isHover[2],
              onHover: (hover) {
                // print(hover);
                setState(() {
                  isHover[2] = true;
                });
              },
              onExit: (exit) {
                setState(() {
                  isHover[2] = false;
                });
              }),
          sideMenus(
              icon: Icon(Icons.location_city, color: Colors.grey.shade700),
              text: 'My Address',
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
              val: isHover[3],
              onHover: (hover) {
                // print(hover);
                setState(() {
                  isHover[3] = true;
                });
              },
              onExit: (exit) {
                setState(() {
                  isHover[3] = false;
                });
              }),
          sideMenus(
              icon: Icon(Icons.contact_page, color: Colors.grey.shade700),
              text: 'About Us',
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
              val: isHover[4],
              onHover: (hover) {
                // print(hover);
                setState(() {
                  isHover[4] = true;
                });
              },
              onExit: (exit) {
                setState(() {
                  isHover[4] = false;
                });
              }),
          sideMenus(
              icon: Icon(Icons.phone, color: Colors.grey.shade700),
              text: 'Contact Us',
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
              val: isHover[5],
              onHover: (hover) {
                // print(hover);
                setState(() {
                  isHover[5] = true;
                });
              },
              onExit: (exit) {
                setState(() {
                  isHover[5] = false;
                });
              }),
          sideMenus(
              icon: Icon(Icons.logout, color: Colors.grey.shade700),
              text: 'Logout',
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
              val: isHover[6],
              onHover: (hover) {
                // print(hover);
                setState(() {
                  isHover[6] = true;
                });
              },
              onExit: (exit) {
                setState(() {
                  isHover[6] = false;
                });
              }),
        ],
      ),
    );
  }

  Widget sideMenus(
      {required Icon icon,
      required String text,
      required Function() onTap,
      required bool val,
      required Function(PointerHoverEvent) onHover,
      required Function(PointerExitEvent) onExit}) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: onHover,
        onExit: onExit,
        child: Container(
          color: !val ? Colors.transparent : Colors.grey.shade300,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: devWidth * 0.01, vertical: devHeight * 0.02),
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: devWidth * 0.01,
                ),
                Text(text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:boulder_bar_app/screens/about_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:boulder_bar_app/screens/routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Stack(
              
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width:400
                ),
                Positioned(
                    left:40,
                    top: 0,
                  child: SizedBox(
                    width: 261,
                    child: SvgPicture.asset(
                      'assets/svg/holds_group.svg',
                    ),
                  ),
                ),
                Positioned(
                    top:
                        170, 
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: 400,
                      child: Image.asset(
                        'assets/images/boulder_bar_logo.png',
                      ),
                    )),
                Positioned(
                  top: 170 + 100, 
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/svg/holds_group_2.svg',
                    width: 173,
                  ),
                ),
              ],
            ),
            SizedBox(height: 450), 

            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 268, 
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC93A31), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30.0), 
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15), 
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Routes()),
                        );
                      },
                      child: Text(
                        'Find Routes',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE6E7E8)),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -10, 
                    top: -20, 
                    child: SvgPicture.asset(
                      'assets/svg/right_find_routes_hold.svg',
                      width: 62, 
                      height: 72, 
                    ),
                  ),
                  Positioned(
                    left: -10, 
                    bottom: -20, 
                    child: SvgPicture.asset(
                      'assets/svg/left_find_routes_hold.svg',
                      width: 64, 
                      height: 57, 
                    ),
                  ),
                ]),
            SizedBox(height: 20), 
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 268, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC93A31), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), 
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 15), 
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                    child: Text(
                      'About',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE6E7E8)),
                    ),
                  ),
                ),
                Positioned(
                  right: -10, 
                  bottom: -20, 
                  child: SvgPicture.asset(
                    'assets/svg/about_us_hold.svg',
                    width: 56, 
                    height: 45, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

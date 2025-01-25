import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                // First SVG at the top
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
                        160, // Position below the first SVG with a 20-pixel gap
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: 400,
                      child: Image.asset(
                        'assets/images/boulder_bar_logo.png',
                      ),
                    )),
                // Second SVG below the image
                Positioned(
                  top: 160 + 80, // Position below the image with a 20-pixel gap
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/svg/holds_group_2.svg',
                    width: 173,
                  ),
                ),
              ],
            ),
            // Add the BoulderBarLogo SVG
            SizedBox(height: 400), // Space between buttons

            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 268, // Fixed width for both buttons
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC93A31), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30.0), // Fully rounded corners
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15), // Button size
                      ),
                      onPressed: () {
                        // Navigate to Find Routes Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindRoutesPage()),
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
                    right: -10, // Adjust the left position as needed
                    top: -20, // Adjust the top position as needed
                    child: SvgPicture.asset(
                      'assets/svg/right_find_routes_hold.svg',
                      width: 62, // Adjust the width as needed
                      height: 72, // Adjust the height as needed
                    ),
                  ),
                  Positioned(
                    left: -10, // Adjust the left position as needed
                    bottom: -20, // Adjust the top position as needed
                    child: SvgPicture.asset(
                      'assets/svg/left_find_routes_hold.svg',
                      width: 64, // Adjust the width as needed
                      height: 57, // Adjust the height as needed
                    ),
                  ),
                ]),
            SizedBox(height: 20), // Space between buttons
            // About Button with SVG on top left
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 268, // Fixed width for both buttons
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC93A31), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Fully rounded corners
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 15), // Button size
                    ),
                    onPressed: () {
                      // Navigate to About Page
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
                // SVG image positioned absolutely on the top left of the button
                Positioned(
                  right: -10, // Adjust the left position as needed
                  bottom: -20, // Adjust the top position as needed
                  child: SvgPicture.asset(
                    'assets/svg/about_us_hold.svg',
                    width: 56, // Adjust the width as needed
                    height: 45, // Adjust the height as needed
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

// Placeholder for Find Routes Page
class FindRoutesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Routes'),
      ),
      body: Center(
        child: Text('This is the Find Routes Page'),
      ),
    );
  }
}

// Placeholder for About Page
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('This is the About Page'),
      ),
    );
  }
}

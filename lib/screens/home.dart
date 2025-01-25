import 'package:boulder_bar_app/screens/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Find Routes Button
            SizedBox(
              width: 268, // Fixed width for both buttons
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC93A31), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Fully rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15), // Button size
                ),
                onPressed: () {
                  // Navigate to Find Routes Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Routes()),
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
            SizedBox(height: 20), // Space between buttons
            // About Button
            SizedBox(
              width: 268, // Fixed width for both buttons
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC93A31), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Fully rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15), // Button size
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
          ],
        ),
      ),
    );
  }
}

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

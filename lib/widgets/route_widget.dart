import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RouteWidget extends StatelessWidget {
  final String id;
  final String img;
  final String title;
  final int difficulty;
  final bool completed;

  const RouteWidget({
    super.key,
    required this.id,
    required this.img,
    required this.title,
    required this.difficulty,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.3;
    final whiteIconsCount = difficulty;
    final blackIconsCount = 5 - whiteIconsCount;
    final fontSize = 18.0 * 2;
    final iconSize = 16.0 * 1.5;
    final titleFontSize = fontSize * 0.75;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRect(
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                height: imageHeight,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              height: imageHeight * 0.9,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          whiteIconsCount,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: SvgPicture.asset(
                              'assets/difficulty_arrow_white.svg',
                              width: iconSize,
                              height: iconSize,
                            ),
                          ),
                        ),
                        ...List.generate(
                          blackIconsCount,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: SvgPicture.asset(
                              'assets/difficulty_arrow_black.svg',
                              width: iconSize,
                              height: iconSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Difficulty',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize / 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/routes_data.dart';

class SingleRoute extends StatefulWidget {
  final String id;

  const SingleRoute({super.key, required this.id});

  @override
  _SingleRouteState createState() => _SingleRouteState();
}

class _SingleRouteState extends State<SingleRoute> {
  late Map<String, dynamic> routeData;

  @override
  void initState() {
    super.initState();
    routeData = routes.firstWhere(
      (route) => route['id'] == widget.id,
      orElse: () => {
        'id': '',
        'img': '',
        'title': 'Route Not Found',
        'difficulty': 0,
        'completed': false,
        'saved': false,
      },
    );
  }

  void _toggleCompletion(bool? value) {
    setState(() {
      routeData['completed'] = value ?? false;

      final index = routes.indexWhere((route) => route['id'] == widget.id);
      if (index != -1) {
        routes[index]['completed'] = routeData['completed'];
      }
    });
  }

  void _toggleSaved() {
    setState(() {
      routeData['saved'] = !routeData['saved'];
      final index = routes.indexWhere((route) => route['id'] == widget.id);
      if (index != -1) {
        routes[index]['saved'] = routeData['saved'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> difficultyIcons = [];
    for (int i = 0; i < 5; i++) {
      difficultyIcons.add(SvgPicture.asset(
        i < routeData['difficulty']
            ? 'assets/difficulty_arrow_white.svg'
            : 'assets/difficulty_arrow_black.svg',
        width: 24,
        height: 24,
      ));
    }

    double imageWidth = MediaQuery.of(context).size.width * 0.4;
    double imageHeight = imageWidth * (16 / 9);
    double arrowsContainerWidth = MediaQuery.of(context).size.width * 0.3;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  title: const Text('Route Details'),
                  backgroundColor: Colors.red,
                  elevation: 0,
                  centerTitle: true,
                  toolbarHeight: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    routeData['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        routeData['img'],
                        fit: BoxFit.cover,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: arrowsContainerWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: difficultyIcons,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'difficulty',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: _toggleSaved,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 32),
                      ),
                      child: Text(
                        routeData['saved'] ? 'UNSAVE ROUTE' : 'SAVE ROUTE',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 600) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: routeData['completed'],
                                  activeColor: Colors.white,
                                  checkColor: Colors.red,
                                  onChanged: _toggleCompletion,
                                ),
                                Text(
                                  routeData['completed']
                                      ? 'COMPLETED'
                                      : 'NOT COMPLETED',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: ElevatedButton(
                                onPressed: _toggleSaved,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade300,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 32),
                                ),
                                child: Text(
                                  routeData['saved']
                                      ? 'UNSAVE ROUTE'
                                      : 'SAVE ROUTE',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: routeData['completed'],
                                    activeColor: Colors.white,
                                    checkColor: Colors.red,
                                    onChanged: _toggleCompletion,
                                  ),
                                  Text(
                                    routeData['completed']
                                        ? 'COMPLETED'
                                        : 'NOT COMPLETED',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],
      ),
    );
  }
}

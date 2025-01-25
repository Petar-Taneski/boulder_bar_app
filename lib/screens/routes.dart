import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/route_widget.dart'; // Importing RouteWidget

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  // Sample data
  final List<Map<String, dynamic>> routes = [
    {
      'id': '1',
      'img': 'assets/photos/abbey_road.png',
      'title': 'Abbey Road',
      'difficulty': 1,
      'completed': false,
    },
    {
      'id': '2',
      'img': 'assets/photos/highway_to_hell.png',
      'title': 'Highway to Hell',
      'difficulty': 2,
      'completed': true,
    },
    {
      'id': '3',
      'img': 'assets/photos/abbey_road.png',
      'title': 'Welcome to the Jungle',
      'difficulty': 3,
      'completed': false,
    },
    {
      'id': '4',
      'img': 'assets/photos/abbey_road.png',
      'title': 'Hard Road',
      'difficulty': 4,
      'completed': true,
    },
    {
      'id': '5',
      'img': 'assets/photos/abbey_road.png',
      'title': 'Iron Man',
      'difficulty': 5,
      'completed': false,
    },
  ];

  String selectedDifficulty = 'Difficulty'; // Default option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dropdown and list of routes logic
            Container(
              color: Colors.red,
              width: double.infinity, 
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedDifficulty,
                      icon: SvgPicture.asset(
                        'assets/dropdown_arrow.svg',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.red,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      underline: Container(),
                      isExpanded: true, // Make the button expand to fill the width
                      items: <String>[
                        'Difficulty',
                        'Very easy',
                        'Easy',
                        'Medium',
                        'Hard',
                        'Very hard'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDifficulty = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // List of route widgets
            Column(
              children: routes
                  .where((route) =>
                      selectedDifficulty == 'Difficulty' || 
                      selectedDifficulty == 'Very easy' && route['difficulty'] == 1 ||
                      selectedDifficulty == 'Easy' && route['difficulty'] == 2 ||
                      selectedDifficulty == 'Medium' && route['difficulty'] == 3 ||
                      selectedDifficulty == 'Hard' && route['difficulty'] == 4 ||
                      selectedDifficulty == 'Very hard' && route['difficulty'] == 5)
                  .map((route) => RouteWidget(
                        id: route['id'],
                        img: route['img'],
                        title: route['title'],
                        difficulty: route['difficulty'],
                        completed: route['completed'],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/route_widget.dart';
import '../data/routes_data.dart'; // Importing routes data

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  String selectedDifficulty = 'Difficulty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      isExpanded: true,
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
            Column(
              children: routes
                  .where((route) =>
                      selectedDifficulty == 'Difficulty' ||
                      selectedDifficulty == 'Very easy' &&
                          route['difficulty'] == 1 ||
                      selectedDifficulty == 'Easy' &&
                          route['difficulty'] == 2 ||
                      selectedDifficulty == 'Medium' &&
                          route['difficulty'] == 3 ||
                      selectedDifficulty == 'Hard' &&
                          route['difficulty'] == 4 ||
                      selectedDifficulty == 'Very hard' &&
                          route['difficulty'] == 5)
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

import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/views/home/home.dart';
import 'package:prepared_academy/views/home/in_class_activities.dart';
import 'package:prepared_academy/views/home/live_quiz.dart';
import 'package:prepared_academy/views/home/my_subjects.dart';

class Navig extends StatefulWidget {
  const Navig({Key? key}) : super(key: key);

  @override
  State<Navig> createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int selectedIndex = 1;
  // double iconSize = 25;

  List<Widget> widgetOptions = [
    Home(),
    MySubjects(),
    InClassActivities(),
    LiveQuiz(),
    Home(),
  ];

  void onItemTap(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;

      if (arguments.isNotEmpty) {
        selectedIndex = arguments["screen"];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          unselectedItemColor: Colors.grey.shade500,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: kPrimaryColor,
          // iconSize: iconSize,
          onTap: onItemTap,
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                activeIcon: Icon(Icons.home_rounded),
                icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
              label: "Subjects",
              activeIcon: Icon(Icons.subject),
              icon: Icon(Icons.subject_outlined),
            ),
            BottomNavigationBarItem(
              label: "Activities",
              activeIcon: Icon(Icons.assignment),
              icon: Icon(Icons.assignment_outlined),
            ),
            BottomNavigationBarItem(
              label: "Live Quiz",
              activeIcon: Icon(Icons.quiz),
              icon: Icon(Icons.quiz_outlined),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outlined),
            )
          ]),
    );
  }
}

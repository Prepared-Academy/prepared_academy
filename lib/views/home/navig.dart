import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/views/home/home.dart';
import 'package:prepared_academy/views/class_activities/in_class_activities.dart';
import 'package:prepared_academy/views/home/live_quiz.dart';
import 'package:prepared_academy/views/home/my_subjects.dart';
import 'package:prepared_academy/views/home/profile.dart';

class Navig extends StatefulWidget {
  const Navig({Key? key}) : super(key: key);

  @override
  State<Navig> createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int selectedIndex = 0;

  List<Widget> widgetOptions = [
    const Home(),
    MySubjects(),
    const InClassActivities(),
    LiveQuiz(),
    const Profile(),
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
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          showSelectedItemShadow: false,
          unselectedItemTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          selectedItemTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          unselectedItemLabelColor: Colors.grey.shade500,
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: kPrimaryColor,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: kPrimaryColor,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: onItemTap,
        items: [
          FFNavigationBarItem(
            iconData: Icons.home_rounded,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.subject,
            label: 'Subjects',
          ),
          FFNavigationBarItem(
            iconData: Icons.assignment,
            label: 'Activities',
          ),
          FFNavigationBarItem(
            iconData: Icons.quiz,
            label: 'Live Quiz',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Account',
          ),
        ],
      ),

      //  BottomNavigationBar(
      //     elevation: 10,
      //     backgroundColor: Colors.white,
      //     selectedLabelStyle: const TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 10,
      //     ),
      //     unselectedLabelStyle: const TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 10,
      //     ),
      //     unselectedItemColor: Colors.grey.shade500,
      //     type: BottomNavigationBarType.fixed,
      //     currentIndex: selectedIndex,
      //     selectedItemColor: kPrimaryColor,
      //     // iconSize: iconSize,
      //     onTap: onItemTap,
      //     items: const [
      //       BottomNavigationBarItem(
      //           label: "Home",
      //           activeIcon: Icon(Icons.home_rounded),
      //           icon: Icon(Icons.home_outlined)),
      //       BottomNavigationBarItem(
      //         label: "Subjects",
      //         activeIcon: Icon(Icons.subject),
      //         icon: Icon(Icons.subject_outlined),
      //       ),
      //       BottomNavigationBarItem(
      //         label: "Activities",
      //         activeIcon: Icon(Icons.assignment),
      //         icon: Icon(Icons.assignment_outlined),
      //       ),
      //       BottomNavigationBarItem(
      //         label: "Live Quiz",
      //         activeIcon: Icon(Icons.quiz),
      //         icon: Icon(Icons.quiz_outlined),
      //       ),
      //       BottomNavigationBarItem(
      //         label: "Profile",
      //         activeIcon: Icon(Icons.person),
      //         icon: Icon(Icons.person_outlined),
      //       )
      //     ]),
    );
  }
}

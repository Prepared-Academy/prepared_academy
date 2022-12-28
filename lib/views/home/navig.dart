import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/views/home/home.dart';
import 'package:prepared_academy/views/class_activities/in_class_activities.dart';
import 'package:prepared_academy/views/home/my_subjects.dart';
import 'package:prepared_academy/views/home/profile.dart';
import 'package:prepared_academy/views/home/rewards.dart';
import 'drawer.dart';

final GlobalKey<ScaffoldState> navigScaffoldKey = GlobalKey();

class Navig extends StatefulWidget {
  const Navig({Key? key}) : super(key: key);

  @override
  State<Navig> createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int selectedIndex = 4;

  List<Widget> widgetOptions = [
    const Home(),
    MySubjects(),
    const InClassActivities(),
    const Rewards(),
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
      key: navigScaffoldKey,
      endDrawer: DrawerBody(),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      //   bottomNavigationBar: CurvedNavigationBar(
      //     key: bottomNavigationKey,
      //     index: 0,
      //     items: const [
      //       CurvedNavigationBarItem(
      //         child: Icon(Icons.home_outlined),
      //       ),
      //       CurvedNavigationBarItem(
      //         child: Icon(Icons.search),
      //       ),
      //       CurvedNavigationBarItem(
      //         child: Icon(Icons.chat_bubble_outline),
      //       ),
      //       CurvedNavigationBarItem(
      //         child: Icon(Icons.newspaper),
      //       ),
      //       CurvedNavigationBarItem(
      //         child: Icon(Icons.perm_identity),
      //       ),
      //     ],
      //     color: Colors.transparent,
      //     buttonBackgroundColor: kPrimaryColor,
      //     backgroundColor: Colors.transparent,
      //     animationCurve: Curves.easeInOut,
      //     animationDuration: const Duration(milliseconds: 0),
      //     onTap: onItemTap,
      //     letIndexChange: (index) => true,
      //   ),
      // );

      // bottomNavigationBar: FFNavigationBar(
      //   theme: FFNavigationBarTheme(
      //     showSelectedItemShadow: false,
      //     unselectedItemTextStyle: const TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 10,
      //     ),
      //     selectedItemTextStyle: const TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 10,
      //     ),
      //     unselectedItemLabelColor: Colors.grey.shade500,
      //     barBackgroundColor: Colors.white,
      //     selectedItemBorderColor: Colors.transparent,
      //     selectedItemBackgroundColor: kPrimaryColor,
      //     selectedItemIconColor: Colors.white,
      //     selectedItemLabelColor: kPrimaryColor,
      //   ),
      //   selectedIndex: selectedIndex,
      //   onSelectTab: onItemTap,
      //   items: [
      //     FFNavigationBarItem(
      //       iconData: Icons.home_rounded,
      //       label: 'Home',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.subject,
      //       label: 'Subjects',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.assignment,
      //       label: 'Activities',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.emoji_events_rounded,
      //       label: 'Rewards',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.person,
      //       label: 'Account',
      //     ),
      //   ],
      // );

      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 8,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 8,
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
            label: "Rewards",
            activeIcon: Icon(Icons.emoji_events_rounded),
            icon: Icon(Icons.emoji_events_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
          )
        ],
      ),
    );
  }
}

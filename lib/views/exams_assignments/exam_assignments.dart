import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ExamsAndAssignments extends StatelessWidget {
  const ExamsAndAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exams & Assignments"),
      ),
      body: Column(
        children: [
          ToggleSwitch(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: 46,
            cornerRadius: 10,
            activeFgColor: Colors.white,
            inactiveFgColor: Colors.black,
            activeBgColor: const [kPrimaryColor],
            inactiveBgColor: Colors.grey.shade300,
            initialLabelIndex: 0,
            totalSwitches: 2,
            labels: ['Exams'.toUpperCase(), 'Assignments'.toUpperCase()],
            onToggle: (index) {},
          ),
          const Expanded(
            child: Center(
              child: Text("No Data..."),
            ),
          )
        ],
      ),
    );
  }
}

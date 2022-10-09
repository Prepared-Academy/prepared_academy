import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';

import '../../utils/app_constants.dart';

class ReportMain extends StatefulWidget {
  const ReportMain({super.key});

  @override
  State<ReportMain> createState() => _ReportMainState();
}

class _ReportMainState extends State<ReportMain> {
  List<Map<String, dynamic>> reportContentTypes = [
    {
      "colorcode1": const Color(0xff4285F4),
      "colorcode2": const Color(0xff4285F4).withOpacity(0.4),
      "icon": AppConstants.QUIZICON,
      "name": "Quiz"
    },
    {
      "colorcode1": const Color(0xffDB4437),
      "colorcode2": const Color(0xffDB4437).withOpacity(0.4),
      "icon": AppConstants.TESTICON,
      "name": "Test"
    },
    {
      "colorcode1": const Color(0xff0F9D58),
      "colorcode2": const Color(0xff0F9D58).withOpacity(0.4),
      "icon": AppConstants.REPORTICON,
      "name": "Report"
    },
    {
      "colorcode1": const Color(0xffF4B400),
      "colorcode2": const Color(0xffF4B400).withOpacity(0.4),
      "icon": AppConstants.ATTENDANCEICON,
      "name": "Attendance"
    },
    {
      "colorcode1": Colors.pink,
      "colorcode2": Colors.pink.withOpacity(0.4),
      "icon": AppConstants.ASSIGNMENTICON,
      "name": "Assignment"
    },
  ];

  Widget contactTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        'Reports List',
        style: TextStyle(
          fontSize: 25,
          color: kBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reports",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        children: List.generate(
            reportContentTypes.length,
            (index) => Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: reportContentTypes[index]["colorcode1"],
                  shadowColor: reportContentTypes[index]["colorcode2"],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        reportContentTypes[index]["icon"],
                        height: 70,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        reportContentTypes[index]["name"],
                        style: const TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}

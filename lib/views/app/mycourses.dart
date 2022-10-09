import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../utils/app_constants.dart';

enum Product { dataScience, programmer, robotics }

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  showCourses() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.info,
        barrierDismissible: true,
        // confirmBtnText: 'Save',
        // customAsset: 'assets/custom.gif',
        title: 'Choose your course ',
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 2.0,
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Product.dataScience);
              },
              child: Row(
                children: [
                  Image.asset(
                    AppConstants.DATASCIENCE,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Data Science',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2.0,
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Product.programmer);
              },
              child: Row(
                children: [
                  Image.asset(
                    AppConstants.PROGRAMMER,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Programmer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2.0,
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Product.robotics);
              },
              child: Row(
                children: [
                  Image.asset(
                    AppConstants.ROBOTICS,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Robotics',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        )

        //  SimpleDialog(
        //   title: const Text(
        //     'Choose your course ',
        //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        //   ),
        //   children: <Widget>
        // ),
        // onConfirmBtnTap: () async {},
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Courses",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                showCourses();
                // final Product? prodName = await _asyncSimple
                // Dialog(context);
                // print("Selected Product is $prodName");
              },
              child: const Text(
                "Show Courses",
                style: TextStyle(fontSize: 20.0),
              ),
              // padding: EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(8.0)
              // ),
              // color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

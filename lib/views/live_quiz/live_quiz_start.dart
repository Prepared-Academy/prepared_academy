import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prepared_academy/providers/live_quiz_provider.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LiveQuizStart extends StatefulWidget {
  const LiveQuizStart({super.key});

  @override
  State<LiveQuizStart> createState() => _LiveQuizStartState();
}

class _LiveQuizStartState extends State<LiveQuizStart> {
  Future<bool> onWillPop() async {
    return await QuickAlert.show(
            showCancelBtn: true,
            barrierDismissible: false,
            cancelBtnText: "Yes",
            confirmBtnText: "No",
            context: context,
            confirmBtnColor: kBlue,
            type: QuickAlertType.warning,
            title: 'Oops..!',
            text: 'Are you sure you want to leave?',
            onCancelBtnTap: () {
              Navigator.of(context, rootNavigator: true).pop(true);
            },
            onConfirmBtnTap: () {
              Navigator.of(context, rootNavigator: true).pop(false);
            }) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Live Quiz"),
        ),
        body: context.watch<LiveQuizProvider>().action == "1"
            ? const WaitingScreen()
            : const LiveQuizQuestionAnwers(),
      ),
    );
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset("assets/lottie/waitingLoader.json", height: 200),
            const Text(
              "You have joined the quiz",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Text(
              "Quiz will be stared by the teacher. Be patient...",
              textAlign: TextAlign.center,
            ),
            Text(context.watch<LiveQuizProvider>().action)
          ],
        ),
      ),
    );
  }
}

class LiveQuizQuestionAnwers extends StatefulWidget {
  const LiveQuizQuestionAnwers({super.key});

  @override
  State<LiveQuizQuestionAnwers> createState() => _LiveQuizQuestionAnwersState();
}

class _LiveQuizQuestionAnwersState extends State<LiveQuizQuestionAnwers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/live_quiz_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';

class EnterPin extends StatelessWidget {
  EnterPin({super.key});
  final _formKey = GlobalKey<FormState>();
  final liveQuizCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Quiz")),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    maxLength: 6,
                    controller: liveQuizCodeController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.0,
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      hintText: "0 0 0 0 0 0",
                      isDense: false,
                      counterText: "",
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "required";
                      } else if (liveQuizCodeController.text !=
                          context.read<LiveQuizProvider>().quizCode) {
                        return "Please enter valid code";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<LiveQuizProvider>()
                            .initWebSocketSubscriptions();
                        OneContext().pushNamed(AppRoutes.LIVEQUIZSTART);
                      }
                    },
                    text: "Join Quiz")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

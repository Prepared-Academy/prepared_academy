import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();
  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

  void sendOTP() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 4);
    if (result) {
      // ignore: avoid_print
      print("OTP is verified");
    } else {
      // ignore: avoid_print
      print("OTP not verified");
    }
  }

  void verifyOTP() {
    bool result = emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _otpcontroller.value.text);
    if (result) {
      // ignore: avoid_print
      print("OTP is verified");
    } else {
      print("OTP not verified");
    }
  }

  Widget _emailAddressField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: "Your email address",
            suffixIcon: TextButton(
              child: const Text("Send OTP"),
              onPressed: () => sendOTP(),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Forgot Password?"),
      ),
      body: Column(
        children: [
          _emailAddressField(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text("Verify OTP"),
            onPressed: () => verifyOTP(),
          )
        ],
      ),
    );
  }
}

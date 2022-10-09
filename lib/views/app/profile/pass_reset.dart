import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../../../themes/color_theme.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

Widget resetPassImag() {
  return Center(
    child: Image.asset(
      AppConstants.PASS_RESET,
      width: 120,
    ),
  );
}

Widget resetPasswordTitle() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Text(
      'Reset Your Password',
      style: TextStyle(
        fontSize: 18,
        color: kPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget resetPasswordDesc() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Text(
      'Set the new password for better security of your account',
      style: TextStyle(
        fontSize: 12,
        color: kPrimaryColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget oldPassword() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextFormField(
        obscureText: false,
        // autofocus: widget.isFocus,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.green,
        // controller: _usernameController,
        // validator: phoneValidator,
        onChanged: (text) {
          // mobileNumber = value;
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          // prefixIcon: Icon(
          //   Icons.email_outlined,
          //   size: 20,
          // ),
          contentPadding: EdgeInsets.all(10),
          focusColor: Colors.greenAccent,
          // labelStyle: ktext14,
          labelText: "Old Password",
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 233, 155, 149),
            fontSize: 14,
          ),
          // prefixText: "+971 |  ",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ));
}

Widget newPasswordForm() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextFormField(
        // autofocus: widget.isFocus,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.green,
        // controller: _usernameController,
        // validator: phoneValidator,
        onChanged: (text) {
          // mobileNumber = value;
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,

          contentPadding: EdgeInsets.all(10),
          focusColor: Colors.greenAccent,
          // labelStyle: ktext14,
          labelText: "New password",
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 233, 155, 149),
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ));
}

Widget confirmPasswordForm() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: TextFormField(
        // autofocus: widget.isFocus,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.green,
        // controller: _usernameController,
        // validator: phoneValidator,
        onChanged: (text) {
          // mobileNumber = value;
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10),
          focusColor: Colors.greenAccent,
          // labelStyle: ktext14,
          labelText: "Confirm Password",
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 233, 155, 149),
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ));
}

Widget confirmButton() {
  return Container(
    height: 55,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.red)))),

      onPressed: () {},
      // onPressed: validateAndSave,
      child: const Center(
        child: Text(
          'Confirm',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: kWhite,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        foregroundColor: kWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Password Reset",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        backgroundColor: kWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            resetPassImag(),
            const SizedBox(
              height: 5,
            ),
            resetPasswordTitle(),
            const SizedBox(
              height: 5,
            ),
            resetPasswordDesc(),
            oldPassword(),
            newPasswordForm(),
            confirmPasswordForm(),
            confirmButton(),
          ],
        ),
      ),
    );
  }
}

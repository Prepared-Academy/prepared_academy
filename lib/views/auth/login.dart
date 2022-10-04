import 'package:flutter/material.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:one_context/one_context.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:prepared_academy/utils/navigates.dart';
import 'package:prepared_academy/views/auth/register.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  // Logi BAckground Image
  Widget BgLogin() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppConstants.LOGIN_STUD),
          // fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Application Logo
  Widget AppLogo() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AppConstants.LOGO_IMAGE,
          height: 120,
          width: 170,
        ),
      ),
    );
  }

  // Login illustration Image
  Widget illustrationLogin() {
    return Center(
      child: Image.asset(
        AppConstants.LOGIN_STUD,
        height: 230,
      ),
    );
  }

  // Guest User Widget

  Widget GuestUser() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
            style: TextButton.styleFrom(backgroundColor: Colors.white10),
            onPressed: () {},
            icon: Image.asset(
              AppConstants.LOGO_ONLY,
              height: 20,
            ),
            label: const Text(
              'Guest User',
              style: TextStyle(
                fontSize: 12,
              ),
            )),
      ),
    );
  }

  Widget LoginText() {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: kBlack,
        ),
      ),
    );
  }

  Widget EmailForm() {
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
            prefixIcon: Icon(
              Icons.email_outlined,
              size: 20,
            ),
            contentPadding: EdgeInsets.all(10),
            focusColor: Colors.greenAccent,
            // labelStyle: ktext14,
            labelText: "Email",
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 233, 155, 149),
              fontSize: 14,
            ),
            prefixText: "+971 |  ",
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

  Widget PasswordForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          obscureText: true,
          // autofocus: widget.isFocus,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: Colors.green,
          // controller: _usernameController,
          // validator: phoneValidator,
          onChanged: (text) {
            // mobileNumber = value;
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.password_outlined,
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            focusColor: Colors.greenAccent,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 233, 155, 149),
              fontSize: 14,
            ),
            labelText: "Enter Password",
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

  Widget RememberMe() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }),
          const Text('Remember Me')
        ],
      ),
    );
  }

  Widget LoginButton() {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // primary: kSecondayColor,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: () {},
        // onPressed: validateAndSave,
        child: const Center(
          child: Text(
            'Login',
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

  Widget OrDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              height: 30,
              color: Colors.black45,
              endIndent: 10,
            ),
          ),
          Text(
            "OR",
            style: TextStyle(color: Colors.black45),
          ),
          Expanded(
            child: Divider(
              height: 30,
              indent: 10,
              color: Colors.black45,
            ),
          )
        ],
      ),
    );
  }

  Widget RegisterButton() {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          // primary: kSecondayColor,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: () => customPush(AppRoutes.REGISTER),
        // onPressed: validateAndSave,
        child: const Center(
          child: Text(
            'Create Account',
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

  Widget ForgotPasstxt() {
    return Center(
      child: Container(
        child: TextButton(
          child: const Text(
            "Forgot password?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: kBlack,
              fontSize: 14,
            ),
          ),
          onPressed: () => _showForgotSheet(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(
              AppConstants.LOGIN_STUD,
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLogo(),
                    // GuestUser(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    illustrationLogin(),
                    // LoginText(),
                    EmailForm(),
                    PasswordForm(),
                    RememberMe(),

                    LoginButton(),
                    OrDivider(),
                    RegisterButton(),
                    ForgotPasstxt(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showForgotSheet() {
  // example modalBottomSheet
  OneContext().showModalBottomSheet<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Forgot?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('No worries, Reset your password!',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
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
                        prefixIcon: Icon(Icons.email_outlined),
                        contentPadding: EdgeInsets.all(10),
                        focusColor: Colors.greenAccent,
                        // labelStyle: ktext14,
                        labelText: "Email",
                        prefixText: "+971 |  ",
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    )),
                Center(
                    child: ElevatedButton(
                  onPressed: () => _verificationBottom(),
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                ))
              ],
            ),
          ));
}

_verificationBottom() {
  String? code;
  // example modalBottomSheet
  OneContext().showModalBottomSheet<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Verify',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child:
                      Text('Verification OTP has been sent to registered mail',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: OTPTextField(
                        length: 5,
                        fieldWidth: 60,
                        outlineBorderRadius: 15,
                        style: TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.box,
                      ),
                    ),
                    Icon(Icons.refresh_outlined),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                ))
              ],
            ),
          ));
}

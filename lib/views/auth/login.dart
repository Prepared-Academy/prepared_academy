import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          height: 150,
          width: 180,
        ),
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
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w700,
          color: kBlack,
        ),
      ),
    );
  }

  Widget EmailForm() {
    return Padding(
        padding: EdgeInsets.all(15.0),
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
            labelText: "Mobile Number",
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
        padding: const EdgeInsets.all(15.0),
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
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            focusColor: Colors.greenAccent,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFFDBDBDB),
              fontSize: 14,
            ),
            labelText: "Enter Password",
            // prefixText: "+91 |  ",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Color(0xFFDBDBDB),
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
        onPressed: () {},
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
          onPressed: () {},
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
                    LoginText(),
                    EmailForm(),
                    PasswordForm(),
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

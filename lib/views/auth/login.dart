import 'package:flutter/material.dart';
import 'package:prepared_academy/models/userModel.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/utils/validators.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/utils/navigates.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;
  bool isLoading = false;

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  // Login BAckground Image
  Widget bgLogin() {
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
  Widget appLogo() {
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

  Widget guestUser() {
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

  Widget loginText() {
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

  Widget emailForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter email';
            } else if (!value.isValidEmail()) {
              return "Invalid email";
            }
            return null;
          },
          controller: _emailController,
          focusNode: myFocusNode,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.green,
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

  Widget passwordForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          controller: _passwordController,
          validator: passwordValidator,
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

  Widget rememberMe() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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

  Widget loginButton() {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // primary: kSecondayColor,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            LoginModel loginModel = LoginModel(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            );
            context.read<AuthProvider>().login(loginModel);
          }
        }, // onPressed: validateAndSave,
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

  Widget orDivider() {
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

  Widget registerButton() {
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

  Widget forgotPasstxt() {
    return Center(
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
    );
  }

  @override
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
                    appLogo(),
                    // GuestUser(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    illustrationLogin(),
                    // LoginText(),
                    emailForm(),
                    passwordForm(),
                    // rememberMe(),

                    loginButton(),
                    orDivider(),
                    registerButton(),
                    forgotPasstxt(),
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
      builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
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
                  )),
              Center(
                  child: ElevatedButton(
                onPressed: () => _verificationBottom(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
                child: const Text('Submit'),
              ))
            ],
          ));
}

_verificationBottom() {
  // example modalBottomSheet
  OneContext().showModalBottomSheet<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) => Column(
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
                child: Text('Verification OTP has been sent to registered mail',
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
                child: const Text('Submit'),
              ))
            ],
          ));
}

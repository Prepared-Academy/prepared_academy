import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/input_decoration.dart';
import 'package:provider/provider.dart';

import '../../models/login_model.dart';
import '../../providers/auth_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _appLogo() {
    return Image.asset(
      AppConstants.LOGOWITHTEXT_IMAGE,
      width: 110,
      height: 50,
    );
  }

  Widget _createText() {
    return const Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 15),
        child: Text(
          'Hi! Welcome back ',
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 24, color: Colors.black),
        ));
  }

  Widget _emailAddressField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: inputDecoration(labelText: "Your email address"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "required";
          }
          return null;
        },
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: inputDecoration(labelText: "Password"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "required";
          }
          return null;
        },
      ),
    );
  }

  Widget _loginButton() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: CustomButton(
          fullWidth: true,
          onPressed: () {
            // if (_formKey.currentState!.validate()) {
            //   LoginModel loginModel = LoginModel(

            //     email: _emailController.text.trim(),

            //     password: _passwordController.text,
            //   );
            //   context.read<AuthProvider>().login(loginModel);
            // }

            LoginModel loginModel = LoginModel(
              email: "s23702@gulfasian.com",
              password: "12345678",
            );
            context.read<AuthProvider>().login(loginModel);
          },
          text: "Sign In",
        ),
      );

  Widget _forgotPassword() => Align(
        alignment: Alignment.topRight,
        child: CustomTextButton(onPressed: () {}, text: "Forgot password?"),
      );

  Widget _registerAccount() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              "New to PreparEd?",
              style: TextStyle(color: Colors.grey.shade700),
            )),
            const SizedBox(width: 10),
            Expanded(
              child: CustomOutlinedButton(
                text: "Register",
                onPressed: () {
                  OneContext().pushNamedAndRemoveUntil(
                      AppRoutes.REGISTER, (route) => false);
                },
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appLogo(),
                _createText(),
                _emailAddressField(),
                _passwordField(),
                _loginButton(),
                _forgotPassword(),
                _registerAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

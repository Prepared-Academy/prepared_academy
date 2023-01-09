import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../widgets/input_decoration.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Widget _preparedLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(
        AppConstants.LOGOWITHTEXT_IMAGE,
        height: 30,
      ),
    );
  }

  Widget _emailAddressField() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: inputDecoration(labelText: "Your email address"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "required";
          } else if (!EmailValidator.validate(value)) {
            return "Invalid email";
          }
          return null;
        },
        onChanged: (value) => setState(() {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _preparedLogo(),
              _emailAddressField(),
              const SizedBox(height: 30),
              CustomButton(
                  fullWidth: true,
                  onPressed: _formkey.currentState == null ||
                          !_formkey.currentState!.validate()
                      ? null
                      : () {
                          context
                              .read<AuthProvider>()
                              .sendOTP(_emailController.text);
                        },
                  text: "REQUEST OTP")
            ],
          ),
        ),
      ),
    );
  }
}

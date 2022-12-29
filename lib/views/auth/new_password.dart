import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../widgets/input_decoration.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _passwordController = TextEditingController();
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

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.emailAddress,
        decoration: inputDecoration(labelText: "New password"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "required";
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
      appBar: AppBar(title: const Text("Update Password")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _preparedLogo(),
              _passwordField(),
              const SizedBox(height: 30),
              CustomButton(
                  fullWidth: true,
                  onPressed: _formkey.currentState == null ||
                          !_formkey.currentState!.validate()
                      ? null
                      : () {
                          context
                              .read<AuthProvider>()
                              .updatePassword(_passwordController.text);
                        },
                  text: "UPDATE")
            ],
          ),
        ),
      ),
    );
  }
}

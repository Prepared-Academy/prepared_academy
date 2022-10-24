import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/input_decoration.dart';
import 'package:prepared_academy/widgets/textfield_column.dart';

import '../../routes/router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _gradeController = TextEditingController();
  final _schoolController = TextEditingController();

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
          'Create Your Account ',
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 24, color: Colors.black),
        ));
  }

  Widget _fullNameField() {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          decoration: inputDecoration(labelText: "Full name"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return null;
          },
        ));
  }

  Widget _phoneField() {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFieldColumn(
          text: "Contact Number",
          widget: IntlPhoneField(
            controller: _phoneController,
            dropdownIconPosition: IconPosition.trailing,
            flagsButtonPadding:
                const EdgeInsets.only(left: 10, top: 5, right: 5, bottom: 5),
            decoration: inputDecoration(labelText: "Mobile number"),
            initialCountryCode: 'AE',
            validator: (value) {
              if (value!.completeNumber.isNotEmpty) {
                return "Phone number required";
              }
              return null;
            },
          ),
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
      child: Row(
        children: [
          Flexible(
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
          ),
          const SizedBox(width: 10),
          Flexible(
            child: TextFormField(
              controller: _confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: inputDecoration(labelText: "Confirm"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required";
                } else if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  return "Both password must be equal";
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _schoolSelectionField() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: DropdownSearch<String>(
          dropdownButtonProps: const DropdownButtonProps(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.arrow_drop_down, color: kPrimaryColor),
          ),
          popupProps: const PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
          ),
          items: AppConstants.schoolList,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: inputDecoration(labelText: "School"),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return null;
          },
          onChanged: ((value) {
            _schoolController.text = value ?? "";
          }),
        ),
      );

  Widget _gradeSelectionField() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: DropdownSearch<String>(
          dropdownButtonProps: const DropdownButtonProps(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.arrow_drop_down, color: kPrimaryColor),
          ),
          popupProps: const PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
          ),
          items: AppConstants.gradesList,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: inputDecoration(
              labelText: "Grade",
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return null;
          },
          onChanged: ((value) {
            _gradeController.text = value ?? "";
          }),
        ),
      );

  Widget _registerButton() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: CustomButton(
          fullWidth: true,
          onPressed: () {
            // if (_formKey.currentState!.validate()) {
            //   CreateAccountModel createAccountModel = CreateAccountModel(
            //     name: _nameController.text.trim(),
            //     email: _emailController.text.trim(),
            //     contactNo: _phoneController.text.trim(),
            //     grade: _gradeController.text.trim(),
            //     demoSchoolName: _schoolController.text.trim(),
            //     password: _passwordController.text,
            //   );
            //   context.read<AuthProvider>().register(createAccountModel);
            // }
            // RegisterModel registerModel = RegisterModel(
            //     name: "Moin khan",
            //     email: "moinkhan@preparedacademy.com",
            //     password: "123456789",
            //     contactNo: "0565642473",
            //     schoolName: "Prepared",
            //     grade: "6");
            // context.read<AuthProvider>().register(registerModel);
          },
          text: "Register",
        ),
      );

  Widget _loginAccount() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              "Already have an account?",
              style: TextStyle(color: Colors.grey.shade700),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: CustomOutlinedButton(
                    text: "Login",
                    onPressed: () {
                      OneContext().pushNamedAndRemoveUntil(
                          AppRoutes.LOGIN, (route) => false);
                    })),
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
                _fullNameField(),
                _phoneField(),
                _schoolSelectionField(),
                _gradeSelectionField(),
                _emailAddressField(),
                _passwordField(),
                _registerButton(),
                _loginAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/input_decoration.dart';
import 'package:prepared_academy/widgets/textfield_column.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget _appLogo() {
    return Center(
      child: Image.asset(
        AppConstants.LOGOWITHTEXT_IMAGE,
        width: 150,
        height: 60,
      ),
    );
  }

  Widget _createText() {
    return const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          'Create Your Account ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ));
  }

  Widget _fullNameField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFieldColumn(
        text: "Full Name",
        widget: TextFormField(
          keyboardType: TextInputType.name,
          decoration:
              inputDecoration(prefixImageIcon: AppConstants.FULLNAME_ICON),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _phoneField() {
    return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFieldColumn(
          text: "Contact Number",
          widget: IntlPhoneField(
            dropdownIconPosition: IconPosition.trailing,
            flagsButtonPadding:
                const EdgeInsets.only(left: 10, top: 5, right: 5, bottom: 5),
            decoration: inputDecoration(hintText: "52 892 1379"),
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
      child: TextFieldColumn(
        text: "Email Address",
        widget: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: inputDecoration(
            prefixImageIcon: AppConstants.EMAIL_ICON,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFieldColumn(
        text: "Password",
        widget: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: inputDecoration(
            prefixImageIcon: AppConstants.PASSWORD_ICON,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFieldColumn(
        text: "Confirm Password",
        widget: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: inputDecoration(
            prefixImageIcon: AppConstants.PASSWORD_ICON,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _schoolSelectionField() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFieldColumn(
          text: "School Name",
          widget: DropdownSearch<String>(
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
              dropdownSearchDecoration: inputDecoration(
                  prefixImageIcon: AppConstants.SCHOOL_ICON,
                  hintText: "Select School"),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "required";
              }
              return null;
            },
          ),
        ),
      );

  Widget _gradeSelectionField() => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextFieldColumn(
          text: "Grade",
          widget: DropdownSearch<String>(
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
                prefixImageIcon: AppConstants.GRADES_ICON,
                hintText: "Select Grade",
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "required";
              }
              return null;
            },
          ),
        ),
      );

  Widget _registerButton() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CustomButton(
          fullWidth: true,
          onPressed: () {},
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
                child: CustomOutlinedButton(text: "Login", onPressed: () {})),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
              _confirmPasswordField(),
              _registerButton(),
              _loginAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

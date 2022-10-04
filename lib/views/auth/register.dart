import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  late String _myActivity;
  late String _myActivityResult;
  @override

  // Application Logo
  Widget AppLogo() {
    return Center(
      child: Image.asset(
        AppConstants.LOGO_IMAGE,
        height: 120,
        width: 170,
      ),
    );
  }

  //Create your Account text

  Widget CreateText() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RichText(
          text: const TextSpan(
            text: ' Create Your\n ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: 'Account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
              // TextSpan(text: ' world!'),
            ],
          ),
        ));
  }

  Widget FullNameReg() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name*: ',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 3,
            ),
            TextFormField(
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
                labelText: "Full Name",
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
            ),
          ],
        ));
  }

  Widget NumberReg() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name*: ',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
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
            ),
          ],
        ));
  }

  Widget SchoolDropdwnReg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Full Name*: ',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 5,
          ),
          DropDownTextField(
            clearOption: false,
            textFieldFocusNode: textFieldFocusNode,
            searchFocusNode: searchFocusNode,
            // searchAutofocus: true,
            dropDownItemCount: 8,
            searchShowCursor: false,
            enableSearch: true,
            searchKeyboardType: TextInputType.number,
            textFieldDecoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.email_outlined,
                size: 20,
              ),
              contentPadding: EdgeInsets.all(10),
              focusColor: Colors.greenAccent,
              // labelStyle: ktext14,
              labelText: "Enter School Name",
              hintText: "Enter School Name",
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
            dropDownList: const [
              DropDownValueModel(name: 'name1', value: "value1"),
              DropDownValueModel(
                  name: 'name2',
                  value: "value2",
                  toolTipMsg:
                      "DropDownButton is a widget that we can use to select one unique value from a set of values"),
              DropDownValueModel(name: 'name3', value: "value3"),
              DropDownValueModel(
                  name: 'name4',
                  value: "value4",
                  toolTipMsg:
                      "DropDownButton is a widget that we can use to select one unique value from a set of values"),
            ],
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }

  Widget GradeDropdwnReg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Full Name*: ',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 5,
          ),
          DropDownTextField(
            clearOption: false,
            textFieldFocusNode: textFieldFocusNode,
            searchFocusNode: searchFocusNode,
            // searchAutofocus: true,
            dropDownItemCount: 8,
            searchShowCursor: false,
            enableSearch: true,
            searchKeyboardType: TextInputType.number,
            textFieldDecoration: const InputDecoration(
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
            dropDownList: const [
              DropDownValueModel(name: 'name1', value: "value1"),
              DropDownValueModel(
                  name: 'name2',
                  value: "value2",
                  toolTipMsg:
                      "DropDownButton is a widget that we can use to select one unique value from a set of values"),
              DropDownValueModel(name: 'name3', value: "value3"),
              DropDownValueModel(
                  name: 'name4',
                  value: "value4",
                  toolTipMsg:
                      "DropDownButton is a widget that we can use to select one unique value from a set of values"),
            ],
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }

  Widget EmailFormReg() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name*: ',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
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
            ),
          ],
        ));
  }

  Widget PasswordFormReg() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name*: ',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
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
            ),
          ],
        ));
  }

  Widget ConfPassReg() {
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Full Name*: ',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
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
                ),
              ],
            )),
      ],
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppLogo(),
            ),
            CreateText(),
            FullNameReg(),
            SchoolDropdwnReg(),
            SizedBox(
              height: 10,
            ),
            GradeDropdwnReg(),
            SizedBox(
              height: 10,
            ),
            NumberReg(),
            EmailFormReg(),
            PasswordFormReg(),
            ConfPassReg(),
            const SizedBox(
              height: 10,
            ),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}

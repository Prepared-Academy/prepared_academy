import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = RequiredValidator(errorText: 'Name is required*');

final phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'Mobile Number is required*'),
  MinLengthValidator(10, errorText: 'Enter a valid Mobile number'),
]);
final pinValidator = MultiValidator([
  RequiredValidator(errorText: 'Required*'),
  MinLengthValidator(6, errorText: 'Enter a valid pin number'),
  MaxLengthValidator(6, errorText: 'Enter a valid pin number')
]);

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required*'),
  MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
]);

final incorrectValidator = RequiredValidator(errorText: 'Incorrect entry*');

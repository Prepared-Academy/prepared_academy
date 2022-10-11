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

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required*'),
  MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
]);

final incorrectValidator = RequiredValidator(errorText: 'Incorrect entry*');

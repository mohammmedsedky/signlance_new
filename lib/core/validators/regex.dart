import 'package:reactive_forms/reactive_forms.dart';

extension StringValidators on String {
  meetsPasswordRequirements() {
    RegExp regExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(this);
  }

  meetsNameRequirements() {
    RegExp regExp = RegExp(r'^[\u0621-\u064A\sa-zA-Z0-9]*$');
    return regExp.hasMatch(this);
  }

  meetsEmailRequirements() {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(this);
  }


}
class KPatterns {
  static const Pattern phonePattern = r'^\d{9}$';
  static const Pattern passPattern = r'^.{6,}$';
  static const Pattern emailPattern=r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static ValidatorFunction mustMatch(String controlName, String matchingControlName) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;
      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);
      if (formControl.value != matchingFormControl.value) {
        matchingFormControl.setErrors({'mustMatch': true});
        matchingFormControl.markAsTouched();
      } else {
        matchingFormControl.removeError('mustMatch');
      }
      return null;
    };
  }
}

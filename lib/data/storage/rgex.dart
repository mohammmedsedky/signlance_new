extension StringValidators on String {
  static const Pattern phonePattern = r'^\d{9}$';
  static const Pattern passPattern = r'^.{6,}$';
  static const Pattern emailPattern=r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  meetsPasswordRequirements() {
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(this);
  }

  meetsNameRequirements() {
    RegExp regExp = RegExp(r'^[\u0621-\u064A\sa-zA-Z0-9]*$');
    return regExp.hasMatch(this);
  }

  meetsEmailRequirements() {
    RegExp regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(this);
  }
}

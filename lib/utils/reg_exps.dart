class RegExps {
  static final email = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final capital = RegExp(r'[A-Z]');
  static final small = RegExp(r'[a-z]');
  static final number = RegExp(r'[0-9]');
  static final character = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
}

class Validator {
  Validator._();

  static const _emailRegExpString =
      r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
      r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';

  static const _phoneNumberRegExpString = r'(84|0[3|5|7|8|9])+([0-9]{8})\b';

  static final _emailRegex = RegExp(_emailRegExpString, caseSensitive: false);
  static final _phoneNumberRegex =
      RegExp(_phoneNumberRegExpString, caseSensitive: false);

  static bool isValidPhoneNumber(String phoneNumber) =>
      _phoneNumberRegex.hasMatch(phoneNumber);

  static bool isValidPassword(String password,
          {int maxLength = 26, int minLength = 8}) =>
      password.isNotEmpty &&
      password.length <= maxLength &&
      password.length >= minLength;

  static bool isValidEmail(String email) => _emailRegex.hasMatch(email);

  static bool isValidUserName(String userName) => userName.isNotEmpty;
}

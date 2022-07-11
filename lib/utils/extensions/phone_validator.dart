extension PhoneValidator on String {
  bool isValidPhone() {
    try {
      return this.length == 10 && int.tryParse(this) != null;
    } catch (e) {
      return false;
    }
  }
}

extension CheckDigit on String {
  bool isDigit() {
    try {
      return int.tryParse(this) != null;
    } catch (e) {
      return false;
    }
  }
}

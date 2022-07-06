extension PhoneValidator on String {
  bool isValidPhone() {
    try {
      return this.length == 10 && int.tryParse(this) != null;
    } catch (e) {
      return false;
    }
  }
}

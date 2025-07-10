class Validators {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username is required';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) return 'Password too short';
    return null;
  }
}
//
// class Validators {
//   static String? validateUsername(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Username is required';
//     }
//     return null;
//   }
//
//   static String? validatePassword(String? value) {
//     if (value == null || value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//     return null;
//   }
// }

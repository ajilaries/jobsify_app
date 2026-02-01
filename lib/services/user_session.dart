import 'package:flutter/foundation.dart';

class UserSession {
  // Reactive notifiers so UI can listen for changes
  static final ValueNotifier<String?> userNameNotifier = ValueNotifier(null);
  static final ValueNotifier<String?> userEmailNotifier = ValueNotifier(null);

  // Backwards-compatible getters/setters that operate on the notifiers
  static String? get userName => userNameNotifier.value;
  static set userName(String? v) => userNameNotifier.value = v;

  static String? get email => userEmailNotifier.value;
  static set email(String? v) => userEmailNotifier.value = v;

  static String? role;

  static bool get isLoggedIn => email != null;

  static void clear() {
    userNameNotifier.value = null;
    userEmailNotifier.value = null;
    role = null;
  }
}


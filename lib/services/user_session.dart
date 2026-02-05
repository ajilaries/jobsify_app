import 'package:flutter/foundation.dart';

class UserSession {
  static final ValueNotifier<String?> userNameNotifier = ValueNotifier(null);
  static final ValueNotifier<String?> emailNotifier = ValueNotifier(null);
  static final ValueNotifier<String?> roleNotifier = ValueNotifier(null);
  static final ValueNotifier<String?> tokenNotifier = ValueNotifier(null);

  static String? get userName => userNameNotifier.value;
  static set userName(String? v) => userNameNotifier.value = v;

  static String? get email => emailNotifier.value;
  static set email(String? v) => emailNotifier.value = v;

  static String? get role => roleNotifier.value;
  static set role(String? v) => roleNotifier.value = v;

  // 🔐 JWT TOKEN (OPTIONAL / FUTURE USE)
  static String? get token => tokenNotifier.value;
  static set token(String? v) => tokenNotifier.value = v;

  // ✅ LOGIN CHECK (SESSION STYLE)
  static bool get isLoggedIn => email != null;

  static void clear() {
    userNameNotifier.value = null;
    emailNotifier.value = null;
    roleNotifier.value = null;
    tokenNotifier.value = null;
  }
}

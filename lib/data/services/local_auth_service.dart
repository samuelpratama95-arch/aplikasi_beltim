class LocalAuthService {
  // Simple in-memory storage for local authentication demo
  static final Map<String, String> _users = {};
  static String? _currentUserEmail;

  static bool register(String email, String password) {
    if (_users.containsKey(email)) {
      return false; // User already exists
    }
    _users[email] = password;
    return true;
  }

  static bool login(String email, String password) {
    if (_users.containsKey(email) && _users[email] == password) {
      _currentUserEmail = email;
      return true;
    }
    return false;
  }

  static void logout() {
    _currentUserEmail = null;
  }

  static String? get currentUser => _currentUserEmail;
  static bool get isLoggedIn => _currentUserEmail != null;
}

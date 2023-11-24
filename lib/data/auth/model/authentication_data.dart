class AuthenticationData {
  AuthenticationData._();
  static final AuthenticationData _internal = AuthenticationData._();
  static final AuthenticationData instance = _internal;

  String? _key;
  
  set setKey(String key) => _key = key;
  String? get key => _key;

  void reset() => _key = null;
}

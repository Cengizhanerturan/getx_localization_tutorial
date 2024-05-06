import 'dart:convert';

class Formatter {
  static dynamic apiDecode(dynamic data) {
    if (data is String) {
      try {
        return jsonDecode(data);
      } catch (e) {
        return null;
      }
    } else if (data is Map || data is List) {
      return data;
    } else {
      return null;
    }
  }
}

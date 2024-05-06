import 'dart:convert';

class LanguageModel {
  final String symbol;
  final String language;
  final String countryCode;
  final String languageCode;

  const LanguageModel({
    required this.symbol,
    required this.language,
    required this.languageCode,
    required this.countryCode,
  });

  factory LanguageModel.fromJson(Map<dynamic, dynamic> json) => LanguageModel(
        symbol: json['symbol'].toString(),
        language: json['language'].toString(),
        languageCode: json['languageCode'].toString(),
        countryCode: json['countryCode'].toString(),
      );

  Map<String, dynamic> toJson() {
    return {
      "symbol": symbol,
      "language": language,
      "languageCode": languageCode,
      "countryCode": countryCode,
    };
  }

  static LanguageModel? decoder(dynamic data) {
    try {
      var decode = apiDecode(data);
      return LanguageModel.fromJson(decode);
    } catch (e) {
      return null;
    }
  }

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

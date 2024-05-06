import 'package:getx_localization_tutorial/core/util/formatter.dart';

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
      var decode = Formatter.apiDecode(data);
      return LanguageModel.fromJson(decode);
    } catch (e) {
      return null;
    }
  }
}

import 'details.dart';

class AmoutModel {
  String? total;
  String? currency;
  Details? details;

  AmoutModel({
    this.total,
    this.currency,
    this.details,
  });

  factory AmoutModel.fromJson(Map<String, dynamic> json) => AmoutModel(
        total: json['total'] as String?,
        currency: json['currency'] as String?,
        details: json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}

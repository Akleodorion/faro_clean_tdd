import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    required this.latitude,
    required this.longitude,
    required this.geocodeUrl,
    required this.country,
    required this.countryCode,
    required this.town,
    this.sublocality,
    this.road,
    this.plusCode,
  });

  final String country;
  final String countryCode;
  final String town;
  final String? sublocality;
  final String? road;
  final String? plusCode;
  final double latitude;
  final double longitude;
  final String geocodeUrl;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        geocodeUrl,
        country,
        countryCode,
        town,
        sublocality,
        road,
        plusCode
      ];

  String getFormattedAddress() {
    return [
      road,
      sublocality,
      town,
      sublocality,
      country,
    ].where((part) => part != null).join(', ');
  }
}

class UserLocation {
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimezone timezone;
  final String city;
  final String state;
  final String country;
  final String postcode;

  UserLocation({
    required this.street,
    required this.coordinates,
    required this.timezone,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  factory UserLocation.fromMap(Map<String, dynamic> map, String postcode) {
    return UserLocation(
      street: LocationStreet.fromMap(map['street']),
      coordinates: LocationCoordinate.fromMap(map['coordinates']),
      timezone: LocationTimezone.fromMap(map['timezone']),
      city: map['city'],
      state: map['state'],
      country: map['country'],
      postcode: postcode,
    );
  }
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> mapStreet) {
    return LocationStreet(
        number: mapStreet['number'],
        name: mapStreet['name'],
      );
  }
}

class LocationCoordinate {
  final String latitude;
  final String longitude;

  LocationCoordinate({required this.latitude, required this.longitude});

  factory LocationCoordinate.fromMap(Map<String, dynamic> mapCoordinate) {
    return LocationCoordinate(
        latitude: mapCoordinate['latitude'],
        longitude: mapCoordinate['longitude'],
      );
  }
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({required this.offset, required this.description});

  factory LocationTimezone.fromMap(Map<String, dynamic> mapTimezone) {
    return LocationTimezone(
        offset: mapTimezone['offset'],
        description: mapTimezone['description'],
      );
  }
}

import 'package:demo_api/models/user_dob.dart';
import 'package:demo_api/models/user_location.dart';
import 'package:demo_api/models/user_name.dart';
import 'package:intl/intl.dart';

class User {
  final UserName name;
  final String email;
  final String imageUrl;
  final String gender;
  final String phone;
  final String nat;
  final UserDob dob;
  final UserLocation location;

  User(
      {required this.name,
      required this.email,
      required this.imageUrl,
      required this.gender,
      required this.nat,
      required this.phone,
      required this.dob,
      required this.location});

  factory User.fromJson(Map<String, dynamic> json) {
    DateTime parsedDate = DateTime.parse(json['dob']['date']);
    String formattedDate = DateFormat('dd MMMM yyyy').format(parsedDate);

    // Handle postcode that could be either int or string
    var postcode = json['location']['postcode'];
    if (postcode is int) {
      postcode = postcode.toString(); // Convert int to string
    }

    return User(
      name: UserName(
        title: json['name']['title'],
        first: json['name']['first'],
        last: json['name']['last'],
      ),
      email: json['email'],
      imageUrl: json['picture']['thumbnail'],
      gender: json['gender'],
      nat: json['nat'],
      phone: json['phone'],
      dob: UserDob(
        date: formattedDate,
        age: json['dob']['age'],
      ),
      location: UserLocation.fromMap(json['location'], postcode)
    );
  }
}

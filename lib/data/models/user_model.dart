class User {
  final String firstName;
  final String lastName;
  final String email;
  final String date;
  final int age;
  final String location;
  final String pictureUrl;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.pictureUrl,
    required this.date,
    required this.age,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['name']['first'] ?? "",
      lastName: json['name']['last'] ?? "",
      email: json['email'] ?? "",
      date: json['dob']['date'] ?? "",
      age: json['dob']['age'] ?? 0,
      location: json['location']['country'] ?? "",
      pictureUrl: json['picture']['medium'] ?? "",
    );
  }
}

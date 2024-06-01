class UserModel {
  final String type;
  final String name;
  final String email;
  final String password;
  final DateTime dateOfBirth;
  final String address;
  final String gender;
  final String areaOfExpertise;
  final String id;

  UserModel({
    required this.type,
    required this.name,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.address,
    required this.gender,
    required this.areaOfExpertise,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
      areaOfExpertise: json['area_of_expertise'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'email': email,
      'password': password,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'address': address,
      'gender': gender,
      'area_of_expertise': areaOfExpertise,
      'id': id,
    };
  }
}

class CreateUserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  CreateUserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  // Firestore se data lene ka sahi tareeqa
  factory CreateUserModel.fromMap(Map<String, dynamic> data) {
    return CreateUserModel(
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }

  // Firestore ya backend me data bhejne ke liye
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}

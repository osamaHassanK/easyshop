class UserModel {
  final String uid;
  final String email;

  UserModel({required this.uid, required this.email});

  // Firestore se data lene ka tareeqa

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] ?? '', // Agar 'uid' missing ho to empty string assign ho
      email: data['email'] ?? '',
    );
  }

  // Firestore ya backend me data bhejne ke liye

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}

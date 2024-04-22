class User {
  late int id;
  late String profileImage;
  late String fullName;
  late String username;
  late String email;
  late String password;
  late String phoneNumber;
  late String gender;
  late int age;

  User(
    this.id,
    this.profileImage,
    this.username,
    this.email,
    this.password,
    this.phoneNumber,
    this.age,
    this.fullName,
    this.gender,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profileImage': profileImage,
      'username': username,
      'email': email,
      'password': password,
      'age': age,
      'fullName': fullName,
      'gender': gender
    };
  }
}

class UserModel {
  final String? name;
  final String? email;
  final String? password;

  UserModel({this.name, this.email, this.password});

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

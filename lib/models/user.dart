class User {
  final String? name;
  final String? email;
  final String? password;

  User({
    this.name,
    this.email,
    this.password,
  });

  factory User.fromJSON(json) => User(
        name: json?['name'],
        email: json?['email'],
        password: json?['password'],
      );

  Map<String, dynamic> toJSON() => {
        'name': name,
        'email': email,
        'password': password,
      };
}

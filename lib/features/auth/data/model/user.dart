class User {
  String email;
  String password;
  String name;
  String phone;
  int avaterId;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  User({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json['email'],
    password: json['password'],
    name: json['name'],
    phone: json['phone'],
    avaterId: json['avaterId'],
    id: json['_id'],
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    v: json['__v'],
  );
}

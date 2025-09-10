class Data {
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    String? parseString(dynamic value) {
      if (value is List) return value.join(','); 
      return value as String?;
    }

    return Data(
      email: parseString(json['email']),
      password: parseString(json['password']),
      name: parseString(json['name']),
      phone: parseString(json['phone']),
      avaterId: json['avaterId'] as int?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt']),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt']),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
        'avaterId': avaterId,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
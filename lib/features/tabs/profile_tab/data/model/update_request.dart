class UpdateRequest {
  String? name;
  String? email;
  String? phone;
  String? avaterId;

  UpdateRequest({this.name, this.phone, this.avaterId});

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "avaterId": avaterId,
  };
}

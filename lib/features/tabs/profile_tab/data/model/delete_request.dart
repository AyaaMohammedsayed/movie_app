class DeleteRequest {
  String? name;
  DeleteRequest({required this.name});
    Map<String, dynamic> toJson() => {
    "name":name,

  };
}

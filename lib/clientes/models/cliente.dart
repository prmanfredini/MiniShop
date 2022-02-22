class ClienteModel {
  int id = 0;
  String firstName = '';
  String lastName = '';
  String city = '';
  String country = '';
  String phone = '';

  ClienteModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.country,
    required this.phone,});

  factory ClienteModel.fromJson(Map<String, dynamic> json) {
    return ClienteModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      city: json['city'],
      country: json['country'],
      phone: json['country'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'city': city,
        'country': country,
        'phone': phone,
      };

}

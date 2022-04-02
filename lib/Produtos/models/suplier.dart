class Suplier {
  final int id;
  final String city;
  final String companyName;
  final String phone;

  Suplier({
    required this.id,
    required this.city,
    required this.companyName,
    required this.phone,
  });

  Suplier.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        city = json['city'],
        companyName = json['companyName'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'city': city,
        'companyName': companyName,
        'phone': phone,
      };
}

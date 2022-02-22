
class Suplier {
  final String city;
  final String companyName;
  final String phone;

  Suplier({
    required this.city,
    required this.companyName,
    required this.phone,
  });

  Suplier.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        companyName = json['companyName'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
    'city': city,
    'companyName': companyName,
    'phone': phone,
  };
}
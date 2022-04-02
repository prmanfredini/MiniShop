class Fornecedor {
  int id = 0;
  String companyName = '';
  String contactName = '';
  String? contactTitle = '';
  String city = '';
  String country = '';
  String phone = '';
  String? fax = '';

  Fornecedor({
    required this.id,
    required this.companyName,
    required this.contactName,
    required this.contactTitle,
    required this.city,
    required this.country,
    required this.phone,
    required this.fax,
  });

  factory Fornecedor.fromJson(Map<String, dynamic> json) {
    return Fornecedor(
      id: json['id'],
      companyName: json['companyName'],
      contactName: json['contactName'],
      contactTitle: json['contactTitle'],
      city: json['city'],
      country: json['country'],
      phone: json['phone'],
      fax: json['fax'],
    );
  }

  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'contactName': contactName,
        'contactTitle': contactTitle,
        'city': city,
        'country': country,
        'phone': phone,
        'fax': fax,
      };
}

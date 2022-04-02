class Cliente {
  final int id;
  final String firstName;
  final String lastName;

  Cliente({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
  };

}
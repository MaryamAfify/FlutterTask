class UserModel {
  int id;
  String name;
  Address address;

  UserModel({required this.id, required this.name, required this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address({required this.street, required this.suite, required this.city, required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}

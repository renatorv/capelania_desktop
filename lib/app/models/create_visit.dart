import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CreateVisit {
  String name;
  String phone;
  String obs;
  String address;
  String madeVisit;
  String dateOfVisit;
  String responsible;

  CreateVisit({
    required this.name,
    required this.phone,
    required this.obs,
    required this.address,
    required this.madeVisit,
    required this.dateOfVisit,
    required this.responsible,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'obs': obs,
      'address': address,
      'madeVisit': madeVisit,
      'dateOfVisit': dateOfVisit,
      'responsible': responsible,
    };
  }

  factory CreateVisit.fromMap(Map<String, dynamic> map) {
    return CreateVisit(
      name: map['name'] as String,
      phone: map['phone'] as String,
      obs: map['obs'] as String,
      address: map['address'] as String,
      madeVisit: map['madeVisit'] as String,
      dateOfVisit: map['dateOfVisit'] as String,
      responsible: map['responsible'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateVisit.fromJson(String source) => CreateVisit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateVisit(name: $name, phone: $phone, obs: $obs, address: $address, madeVisit: $madeVisit, dateOfVisit: $dateOfVisit, responsible: $responsible)';
  }
}

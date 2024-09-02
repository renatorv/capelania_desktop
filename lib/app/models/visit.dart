import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Visit {
  String id;
  String name;
  String phone;
  String description;
  String address;
  String createdAt;
  String dateOfVisit;
  bool visitMade;
  String responsible;

  Visit(
      {required this.id,
      required this.name,
      required this.phone,
      required this.description,
      required this.address,
      required this.createdAt,
      required this.dateOfVisit,
      required this.visitMade,
      required this.responsible
      });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'description': description,
      'address': address,
      'createdAt': createdAt,
      'dateOfVisit': dateOfVisit,
      'responsible': responsible
    };
  }

  factory Visit.fromMap(Map<String, dynamic> map) {
    return Visit(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      description: map['description'] as String,
      address: map['address'] as String,
      createdAt: map['createdAt'] as String,
      dateOfVisit: map['dateOfVisit'] as String,
      visitMade: map['visitMade'] as bool,
      responsible: map['responsible'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Visit.fromJson(String source) => Visit.fromMap(json.decode(source) as Map<String, dynamic>);
}

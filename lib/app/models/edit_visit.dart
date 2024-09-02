// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EditVisitModel {
  String objectId;
  String name;
  String phone;
  String address;
  String dateOfVisit;
  String obs;
  String madeVisit;
  String responsible;

  EditVisitModel({
    required this.objectId,
    required this.name,
    required this.phone,
    required this.address,
    required this.dateOfVisit,
    required this.obs,
    required this.madeVisit,
    required this.responsible,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'name': name,
      'phone': phone,
      'address': address,
      'dateOfVisit': dateOfVisit,
      'obs': obs,
      'madeVisit': madeVisit,
      'responsible': responsible,
    };
  }

  factory EditVisitModel.fromMap(Map<String, dynamic> map) {
    return EditVisitModel(
      objectId: map['objectId'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      dateOfVisit: map['dateOfVisit'] as String,
      obs: map['obs'] as String,
      madeVisit: map['madeVisit'] as String,
      responsible: map['responsible'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EditVisitModel.fromJson(String source) => EditVisitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EditVisitModel(objectId: $objectId, name: $name, phone: $phone, address: $address, dateOfVisit: $dateOfVisit, obs: $obs, madeVisit: $madeVisit)';
  }
}

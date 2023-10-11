// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Client {
  final String raisonSocial;
  final String address;
  final String fixe;
  final String contact;
  final String gsm;
  Client({
    required this.raisonSocial,
    required this.address,
    required this.fixe,
    required this.contact,
    required this.gsm,
  });

  Client copyWith({
    String? raisonSocial,
    String? address,
    String? fixe,
    String? contact,
    String? gsm,
  }) {
    return Client(
      raisonSocial: raisonSocial ?? this.raisonSocial,
      address: address ?? this.address,
      fixe: fixe ?? this.fixe,
      contact: contact ?? this.contact,
      gsm: gsm ?? this.gsm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'raisonSocial': raisonSocial,
      'address': address,
      'fixe': fixe,
      'contact': contact,
      'gsm': gsm,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      raisonSocial: map['raisonSocial'] as String,
      address: map['address'] as String,
      fixe: map['fixe'] as String,
      contact: map['contact'] as String,
      gsm: map['gsm'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Client(raisonSocial: $raisonSocial, address: $address, fixe: $fixe, contact: $contact, gsm: $gsm)';
  }

  @override
  bool operator ==(covariant Client other) {
    if (identical(this, other)) return true;

    return other.raisonSocial == raisonSocial &&
        other.address == address &&
        other.fixe == fixe &&
        other.contact == contact &&
        other.gsm == gsm;
  }

  @override
  int get hashCode {
    return raisonSocial.hashCode ^
        address.hashCode ^
        fixe.hashCode ^
        contact.hashCode ^
        gsm.hashCode;
  }
}

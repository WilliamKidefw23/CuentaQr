import 'package:cloud_firestore/cloud_firestore.dart';

class AcccountModel {
  final double amount;
  final Timestamp creation;
  final String currency;
  final String type;
  final String usuario;

  const AcccountModel({
    required this.usuario,
    required this.type,
    required this.currency,
    required this.creation,
    required this.amount,
  });

  factory AcccountModel.fromJson(Map<String, dynamic> json) {
    return AcccountModel(
      amount: json['amount'].toDouble(),
      creation: json['creation'],
      currency: json['currency'],
      type: json['type'],
      usuario: json['usuario'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'amount': amount,
      'creation': creation,
      'currency': currency,
      'type': type,
      'usuario': usuario
    };
  }
}

import 'dart:ffi';

import 'package:intl/intl.dart';

DateTime date = DateTime.parse("2023-11-15");
String nov15 = DateFormat('MMM d, y').format(date);
DateTime date14 = DateTime.parse("2023-11-14");
String nov14 = DateFormat('MMM d, y').format(date14);
DateTime date13 = DateTime.parse("2023-11-13");
String nov13 = DateFormat('MMM d, y').format(date13);

class UserModel {
  final int id;
  final String name;
  final String date;
  final String image;
  final String amount;
  final bool status;
  final String invoice;
  UserModel(
      {required this.id,
      required this.name,
      required this.date,
      required this.image,
      required this.amount,
      required this.status,
      required this.invoice});
  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        id: json['id'] as int,
        name: json['name'] as String,
        date: json['date'] as String,
        image: json['image'] as String,
        amount: json['amount'] as String,
        status: json['status'] as bool,
        invoice: json['invoice'] as String);
  }
}

final List users = [
  {
    "id": 1,
    "name": "Marcus Bergson",
    "date": nov15,
    "image": "lib/assets/images/usersicon1.png",
    "amount": "\$80,000",
    "status": true,
    "invoice": "lib/assets/images/document-download.svg"
  },
  {
    "id": 2,
    "name": "Jaydon Vaccaro",
    "date": nov15,
    "image": "lib/assets/images/usersicon2.png",
    "amount": "\$150,000",
    "status": false,
    "invoice": "lib/assets/images/document-download.svg"
  },
  {
    "id": 3,
    "name": "Corey Schleifer",
    "date": nov14,
    "image": "lib/assets/images/usersicon3.png",
    "amount": "\$87,000",
    "status": true,
    "invoice": "lib/assets/images/document-download.svg"
  },
  {
    "id": 4,
    "name": "Cooper Press",
    "date": nov14,
    "image": "lib/assets/images/usersicon4.png",
    "amount": "\$100,000",
    "status": false,
    "invoice": "lib/assets/images/document-download.svg"
  },
  {
    "id": 5,
    "name": "Phillip Lubin",
    "date": nov13,
    "image": "lib/assets/images/usersicon5.png",
    "amount": "\$78,000",
    "status": true,
    "invoice": "lib/assets/images/document-download.svg"
  }
];

class AnalyticsData {
  final String months;
  final double trends;
  AnalyticsData(this.months, this.trends);
}

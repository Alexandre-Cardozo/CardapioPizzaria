import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class IModel<T> {
  T fromMap(Map<String, dynamic> map);

  T fromJson(String element) =>
      fromMap(json.decode(element) as Map<String, dynamic>);

  Map<String, dynamic> toMap();

  String toJson() => json.encode(toMap());

  // IModel fromJson(Map<String, dynamic> json);
  DateTime parseDateTime(String dateTime) =>
      DateTime.tryParse(dateTime) ?? DateTime.now();

  String stringValidator(String string) => string == 'null' ? '' : string;
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp value) => value.toDate();

  @override
  Timestamp toJson(DateTime value) => Timestamp.fromDate(value);
}

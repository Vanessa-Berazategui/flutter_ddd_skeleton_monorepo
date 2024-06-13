// ignore_for_file: one_member_abstracts

// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

@immutable
abstract class BaseModel {
  Map<String, dynamic> toJson();
}

extension BaseModelX on BaseModel {
  String get jsonString => jsonEncode(toJson());
}

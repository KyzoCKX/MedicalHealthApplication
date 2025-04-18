import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? newCustomFunction(List<int>? var1) {
  if (var1 == null) {
    return 1;
  }
  int variableCount = 1;

  for (var element in var1) {
    variableCount++;
  }
  return variableCount;
}

int? indexIncrease(int? currentQuestion) {
  return currentQuestion != null ? currentQuestion + 1 : null;
}

int? multiplier(int? questionNum) {
  if (questionNum == null) {
    return null;
  } else {
    return questionNum * 5;
  }
}

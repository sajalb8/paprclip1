import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Performance {
  int iD;
  String label;
  String chartPeriodCode;
  double changePercent;


  Performance({
    required this.iD,
    required this.label,
    required this.chartPeriodCode,
    required this.changePercent});

  factory Performance.fromJson(Map<String,dynamic> json)
  {
    return Performance(iD: json['ID'], label: json['Label'] , chartPeriodCode: json['ChartPeriodCode'] , changePercent: json['ChangePercent']);
  }

}
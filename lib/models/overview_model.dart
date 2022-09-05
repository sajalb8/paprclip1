import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Overview {
   int? iD;
   String? security;
  int? industryID;
   String? industry;
   int? sectorID;
   String? sector;
   double? mCAP;
  String? eV;
  String? eVDateEnd;
   double ?bookNavPerShare;
   double? tTMPE;
   int? tTMYearEnd;
   double? yield;
    int ?yearEnd;
   String? sectorSlug;
   String ?industrySlug;
   String? securitySlug;
   double? pEGRatio;

  Overview(
      {required this.iD,
        required this.security,
        required this.industryID,
        required this.industry,
        required this.sectorID,
        required this.sector,
        required this.mCAP,
        required this.eV,
        required this.eVDateEnd,
        required this.bookNavPerShare,
        required this.tTMPE,
        required this.tTMYearEnd,
        required this.yield,
        required this.yearEnd,
        required this.sectorSlug,
        required this.industrySlug,
        required this.securitySlug,
        required this.pEGRatio});

  factory Overview.fromJson(Map<String, dynamic> json) {
    return Overview(
    iD : json['ID'],
    security : json['Security'],
    industryID : json['IndustryID'],
    industry : json['Industry'],
    sectorID : json['SectorID'],
    sector : json['Sector'],
    mCAP : json['MCAP'],
    eV : json['EV'],
    eVDateEnd : json['EVDateEnd'],
    bookNavPerShare : json['BookNavPerShare'],
    tTMPE : json['TTMPE'],
    tTMYearEnd : json['TTMYearEnd'],
    yield : json['Yield'],
    yearEnd : json['YearEnd'],
    sectorSlug : json['SectorSlug'],
    industrySlug : json['IndustrySlug'],
    securitySlug : json['SecuritySlug'],
    pEGRatio : json['PEGRatio']);
  }


}

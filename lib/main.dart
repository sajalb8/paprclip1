import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paprclip/models/performance_model.dart';
import 'package:paprclip/models/overview_model.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:paprclip/api_service/overview_api.dart';

import 'api_service/performance_api.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {return  MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white,
    body:
    SingleChildScrollView(child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding:EdgeInsets.all(10),
            child:Text("Overview",style: TextStyle(fontSize: 20,color: Colors.blue[700]),)),
        OverView(),
        Padding(
          padding: EdgeInsets.all(10),
          child:Text("Performance",style: TextStyle(fontSize: 20,color: Colors.blue[700]),),
        ),
        PerformanceScreen(),
      ],
    ),
    )
  ));
  }
}

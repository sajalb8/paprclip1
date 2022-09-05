import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paprclip/models/performance_model.dart';
import 'package:paprclip/models/overview_model.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';










class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({Key? key}) : super(key: key);

  @override
  _PerformanceScreenState createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final String apiUrl = "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      color: Colors.white,

      padding: const EdgeInsets.all(10),
      child: FutureBuilder<List<Performance>>(
        future: fetchPerformance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Performance> performance = snapshot.data as List<Performance>;
            return ListView.builder(
              shrinkWrap: true,
                itemCount: performance.length,
                itemBuilder: (context, index) {
                  return Container(

                    width: width,
                    padding: EdgeInsets.all(5),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex:1,
                            child: Text(performance[index].label)),
                        Expanded(
                            flex:2,
                            child:Container(
                            padding: EdgeInsets.all(10),
                            child: LinearPercentIndicator(
                              width: width/3,

                              lineHeight: 30.0,

                              percent: performance[index].changePercent.abs()>100?1:performance[index].changePercent.abs()/100,
                              linearStrokeCap: LinearStrokeCap.roundAll,

                              progressColor:performance[index].changePercent>0? Colors.green:Colors.redAccent,
                                                  backgroundColor: Colors.grey[200],
                            ))),
                        Expanded(
                            flex:1,
                            child: Container(
                              child:Row(
                                children: <Widget> [
                                  Icon(performance[index].changePercent>0?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_sharp, color:performance[index].changePercent>0?Colors.green:Colors.red),
                                Text("${num.parse(performance[index].changePercent.toStringAsFixed(1))}%",style: TextStyle(color: performance[index].changePercent>0?Colors.green:Colors.red),)])))

                      ],
                    ),
                  );
                });
          }
          if (snapshot.hasError) {

            return Text('error');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<Performance>> fetchPerformance() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body) as List)
        .map((e) => Performance.fromJson(e))
        .toList();
  }
}
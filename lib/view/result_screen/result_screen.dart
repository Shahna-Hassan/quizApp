import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart';
class ResultScreen extends StatefulWidget {
   ResultScreen({required this.result,super.key});
  double result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Center(child: Lottie.asset("assets/animation2.json",fit: BoxFit.cover)),
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 10.0,
                        percent: widget.result/100,
                        center: new Text("${widget.result}", style: TextStyle(fontSize: 20),),
                        progressColor: Colors.green,
                      ),
                      SizedBox(height: 30,),
                      Text("YOUR SCORE", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ],
      ),





    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_lumi13/view/home_screen/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
 @override
void initState() {

    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)));
  }
 
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
body:
 Stack(
  fit: StackFit.expand,
  
   children: [
    Image.network( fit: BoxFit.cover,"https://img.freepik.com/premium-photo/blue-question-mark-random-pattern-background-illustration_103740-566.jpg"),
   Center(
      child: Lottie.asset("assets/animation1.json",
        // width: 400, // Adjust width as needed
        //         height: 400, // Adjust height as needed
                fit: BoxFit.cover,),
   
   ),
 ],
 ),


    );
  }
}
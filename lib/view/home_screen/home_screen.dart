import 'package:flutter/material.dart';
import 'package:flutter_lumi13/utils/database.dart';
import 'package:flutter_lumi13/view/result_screen/result_screen.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
 int currentIndex = 0;
  int selectedOptionIndex = -1;
    int? correctAnswerIndex;
double result=0.0;

  void nextQuestion() {
    setState(() {
      currentIndex = (currentIndex + 1) % DataBase.quizData.length;
       selectedOptionIndex = -1; 
       correctAnswerIndex = null;
    });
    if (currentIndex == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(result:result)), // Navigate to ResultScreen
    );
  }
  }
void checkAnswer(int optionIndex) {
   correctAnswerIndex = DataBase.quizData[currentIndex]['answer'];

  setState(() {
    selectedOptionIndex = optionIndex;
  });

  if (optionIndex == correctAnswerIndex) {
    result+=10.0;
    // Correct answer selected, change the color to green
    setState(() {
      correctAnswerIndex = optionIndex;
    });
  }
}

  

  @override
  Widget build(BuildContext context) {
    final question = DataBase.quizData[currentIndex]['question'];
    final options = List<String>.from(DataBase.quizData[currentIndex]['options']);

    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network( fit: BoxFit.cover,"https://img.freepik.com/premium-photo/blue-question-mark-random-pattern-background-illustration_103740-566.jpg"),
            
         
          Center(
            
            child:
             Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),color: Colors.lightBlue,
                  ),
                  
                  height: 150,
                  width: 300,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  
                    children: [
                   
                      
                      Center(
                      
                        child: Padding(
                          
                        padding: const EdgeInsets.all(8.0),
                        child: Text(question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ))]),
                ),
                SizedBox(height: 25,),
               
   
                
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:options.length ,itemBuilder: (context, index) {
                      final option = options[index];
               final isCorrect = selectedOptionIndex == index && index == correctAnswerIndex;
final isWrong = selectedOptionIndex == index && index != correctAnswerIndex;

final color = isCorrect
    ? Colors.green
    : isWrong
        ? Colors.red
        : Colors.white;



                  return Column(
                   
                    
                    children: [
                            SizedBox(height: 15,),
                      Container(
                      
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)
                        ),
                
                        child: ElevatedButton(style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(color),

                        ),
                          
                          
                          onPressed: () {
                          if (selectedOptionIndex == -1) {
                      checkAnswer(index);
                    }
                          
                        },
                        
                         child: Text(option ,style: TextStyle(color: Colors.black) )),
                      ),
                    ],
                  );
                },),
                SizedBox(height: 40,),
                ElevatedButton(
                  style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Colors.amber),

                        ),
                  
                  onPressed: () {

                    nextQuestion();
                }, child: Text("NEXT", style: TextStyle(color: Colors.black)))
               
             
              ],
            ),
          ),
        ],
      ),


    );
  }
}
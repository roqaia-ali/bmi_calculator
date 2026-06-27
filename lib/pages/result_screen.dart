import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
 final double result;
  const ResultScreen({super.key, required this.result, });
    String getCategery(){
      if(result<18.5){
        return 'underwieghted';
      }
    else if (result < 25.5) {
      return 'normal';
    }
    else if (result < 30.5) {
      return 'overwieghted';
    }
     else {
      return 'obese';
    }


   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("result screen",style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon:Icon(Icons.arrow_back,color: Colors.white,) 
          
        ),
       ),

      body:
      
       Center(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
              
              Text("your result",style: TextStyle(color: Colors.white,fontSize: 25),),
              SizedBox(height: 15,),
              Expanded(
                child: Container(decoration: BoxDecoration(color: appcolor.cardcolor,borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.all(15.0),),
                    Text(getCategery(),style: TextStyle(color: Colors.green,fontSize: 20),),
                    //SizedBox(height: 100,),
                     Text(
                        result.toStringAsFixed(2),
                        style: TextStyle(fontSize: 35,color: Colors.white),
                      ),
                        //SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text("your body wieght is absoltle ${getCategery()}",//textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white,),
                        ),
                      ),

                  ],
                  
                ),
                
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("recalculate"),style: ElevatedButton.styleFrom(backgroundColor: appcolor.primaryColor,foregroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),padding: EdgeInsets.all(25)),)),
            ],
                 ),
         ),
       )
        
        //child: Text(result.toStringAsFixed(2),style: TextStyle(fontSize: 35),)
      
      
    );

  }
}
import 'dart:math';

class Result{
  final int weight;
  final int height;
   double _bmi=0.0;
  Result({required this.weight,required this.height});
 String  getResult(){
    _bmi=weight/pow(height/100, 2);
   return _bmi.toStringAsFixed(1);

  }
  String getData(){
   if(_bmi>=25){
     return 'overweight'.toUpperCase();
   }else if(_bmi>=18.5){
     return'normal'.toUpperCase();
   }else{
     return'underweight'.toUpperCase();
   }
  }
  String getRecomendation(){
    if(_bmi>=25){
      return 'You must go to the gym.';
    }else if(_bmi>=18.5){
      return'Good , you should keep';
    }else{
      return'please eat more!';
    }
  }



}
import 'dart:math';

class Game {
  static const maxRandom = 100;
  int? answer;
  int c = 0;
  var r = Random();
  Game(){

    answer = r.nextInt(maxRandom)+1;
  }
  setNumber(){
    c=0;
    answer = r.nextInt(maxRandom)+1;
  }
  int doGuess(int num){
    if(num > answer!){
      c++;
      return 1;
    }else if(num < answer!){
      c++;
      return -1;
    }else{
      c++;
      return 0;
    }
  }

  int countNum(){
    return c;
  }
}
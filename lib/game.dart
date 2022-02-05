import 'package:flutter/material.dart';
import 'dart:math';

class Game {
  var maxRandom = 100;
  int? answer;
  static List<int> myList = [];
  int c = 0;
  var r = Random();
  Game({int maxRandom = 100}){

    answer = r.nextInt(maxRandom)+1;
  }
  void setNumber(){

    c=0;
    answer = r.nextInt(maxRandom)+1;
  }
  int doGuess(int num){
    c++;
    if(num > answer!){

      return 1;
    }else if(num < answer!){

      return -1;
    }else{

      return 0;
    }
  }
  int getLen(){
      var len = myList.length;
      return len;
  }
  void addList(){
    myList.add(c);

  }
  int countNum(){

    return c;
  }
}
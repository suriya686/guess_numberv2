import 'dart:io';

import 'dart:math';



void main() {
  var i = 0;
  var c = 0;
  var r = Random();
  var answer = r.nextInt(100);

  do{
    stdout.write('Please guess the number between 1 and 100:');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if(guess != null){
      if(guess > answer){
        print(guess.toString() + " is TOO HIGH! ▲");
        c++;
      }
      if(guess < answer){
        print(guess.toString() + " is TOO LOW! ▼");
        c++;
      }
      if(guess == answer){

        c++;
        i++;
        print(guess.toString() + " is CORRECT ✓ ,Total guesses: " + c.toString());
      }



    }else{
      i=0;
    }
  }while(i == 0);
}
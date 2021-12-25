import 'dart:io';

import 'dart:math';

import 'game.dart';





void main() {
  const maxRandom = 100;
  var i = 0;
  var p = 0;
  var r = Random();

  var game =Game();

      do{
    stdout.write('Please guess the number between 1 and 100:');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);

    if(guess != null){
      var result = game.doGuess(guess);
      if(result == 1){
        print(guess.toString() + " is TOO HIGH! ▲");
      }
      else if(result == -1){
        print(guess.toString() + " is TOO LOW! ▼");
      }
       else if(result == 0){
        int c = game.countNum();
        print(guess.toString() + " is CORRECT ✓ ,Total guesses: $c");
        game.setNumber();
        do {
          stdout.write('Play again ? (Y/N): ');
          var play = stdin.readLineSync();
          if(play != 'Y'||play != 'N'){
            p = 0;
          }
          if(play == 'Y'||play == 'y') {
            i = 0;
            p = 1;
          }
          if(play == 'N'||play == 'n'){
            i=1;

            break;
          }
        }while(p == 0);
      }




    }else{
      i=0;
    }
  }while(i == 0);


}

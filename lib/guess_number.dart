import 'dart:io';


import 'game.dart';





void main() {


  var w =0;
  var p = 0;
  while(w == 0) {
    var i = 0;
    stdout.write('Enter a maximum number to random: ');
    var max = stdin.readLineSync();
    var mran = int.tryParse(max!);

    var game = Game(maxRandom: mran!);
    do {

      stdout.write('Please guess the number between 1 and $max:');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess != null) {
        var result = game.doGuess(guess);
        if (result == 1) {
          print(guess.toString() + " is TOO HIGH! ▲");
        }
        else if (result == -1) {
          print(guess.toString() + " is TOO LOW! ▼");
        }
        else if (result == 0) {

          print(guess.toString() + " is CORRECT ✓ ,Total guesses: ${game.countNum()}");
          game.addList();


          do {

            stdout.write('Play again ? (Y/N): ');
            var play = stdin.readLineSync();
            if (play != 'Y' || play != 'N') {

              p = 0;
            }
            if (play == 'Y' || play == 'y') {
              game.setNumber();
              w = 0;
              i = 1;
              p = 1;
            }
            if (play == 'N' || play == 'n') {
              print(" You've played : ${Game.myList.length} games");
              for (var i = 0; i < Game.myList.length; i++) {
                print(' 🚀 Game #${i+1} : ${Game.myList[i]} guesses');
              }

              i = 1;
              w = 1;

              break;
            }
          } while (p == 0);
        }
      } else {
        i = 0;
      }
    } while (i == 0);
  }

}

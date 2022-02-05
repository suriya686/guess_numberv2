import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess The Number',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  static const buttonSize = 60.0;

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var game = Game(maxRandom: 100);
  String _input = '';
  String _input2 = "ทายเลข 1 ถึง 100";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GUESS THE NUMBER')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(2.0, 5.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/guess_logo.png',
                            height: 220),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' GUESS',
                              style: TextStyle(
                                  fontSize: 50.0,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '  THE NUMBER',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_input, style: TextStyle(fontSize: 20.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_input2, style: TextStyle(fontSize: 15.0)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 1; i <= 3; i++) buildButton(i),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 4; i <= 6; i++) buildButton(i),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 7; i <= 9; i++) buildButton(i),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            print("Delete");
                            setState(() {
                              _input = " ";
                            });
                          },
                          borderRadius:
                          BorderRadius.circular(LoginPage.buttonSize / 2),
                          child: Container(
                            alignment: Alignment.center,
                            width: LoginPage.buttonSize,
                            height: LoginPage.buttonSize,
                            child: Icon(Icons.close,size: 40,),
                          ),
                        ),
                      ),
                      buildButton(0),
                      buildButton(-1),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text('GUESS',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                              primary: Colors.deepOrangeAccent, backgroundColor: Colors.yellow),
                          onPressed: () {
                            var guess = int.tryParse(_input);
                            if (guess == null) {
                              setState(() {
                                _input = " ";
                              });
                              _input2 = 'กรอกข้อมูลไม่ถูกต้อง';
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                Text(_input2),
                              );
                            }
                            var result = game.doGuess(guess!);
                            if (result == 1) {
                              setState(() {
                                _input = " ";
                              });
                              _input2 = '$guess มากเกินไป!';
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                Text(_input2),
                              );
                            } else if (result == -1) {
                              setState(() {
                                _input = " ";
                              });
                              _input2 = '$guess น้อยเกินไป!';
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                Text(_input2),
                              );
                            } else {
                              setState(() {
                                _input = " ";
                              });
                              _input2 =
                              '$guess ถูกต้อง! จำนวนการทาย ${game.countNum()} ครั้ง';
                              game.setNumber();
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                Text(_input2,),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          if (num == -1) {
            print('Backspace');

            setState(() {
              var length = _input.length;
              _input = _input.substring(0, length - 1);
            });
          } else {
            if (_input.length < 4) {
              print('$num');

              setState(() {
                _input = '$_input$num';
              });
            }
          }
        },
        borderRadius: BorderRadius.circular(LoginPage.buttonSize / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: Colors.black)
          ),
          alignment: Alignment.center,
          width: LoginPage.buttonSize,
          height: LoginPage.buttonSize,
          child: (num == -1)
              ? Icon(Icons.backspace,size: 40,)
              : Text(
            '$num',
            style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.black,fontSize: 20),

          ),
        ),
      ),
    );
  }
}
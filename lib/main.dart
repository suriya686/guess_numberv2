import 'package:flutter/material.dart';
import 'package:guess_number/nextPage.dart';
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
  String _input = '';
  var num1 = 0;
  var num2 = 6;
  String _input2 = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.orangeAccent,]

            ),),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              size: 100.0,
                              color: Colors.yellow,

                            ),
                            SizedBox(height: 20,),
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 35.0, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10,),

                            Text(
                              'Enter PIN to login',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < num1; i++)
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  width: 40.0,
                                  height: 40.0,
                                ),
                              ),
                            for (var i = 0; i < num2 - num1; i++)
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(

                                      shape: BoxShape.circle,
                                      border: Border.all(width:3.0,color: Colors.black)
                                  ),
                                  alignment: Alignment.center,
                                  width: 40.0,
                                  height: 40.0,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
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
                              _input = "";
                              num1 = 0;
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
                    child: TextButton(
                      child: Text('Forgot Password?'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,

                      ),
                      onPressed: () {},
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
              num1--;
            });
          } else {
            if (_input.length < 6) {
              _input = '$_input$num';
              setState(() {
                num1 = _input.length;
              });
            }
          }
          if(_input2 == _input) {Navigator.push(context, MaterialPageRoute(builder: (context) => const nextPage()),);
          }else if(_input2 != _input && _input.length == 6){
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Incorrect PIN'),
                    content: Text(
                        'Please try again.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      )
                    ],
                  );
                });
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
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amberAccent.withOpacity(0.5),
              border: Border.all(width: 2.0, color: Colors.deepOrange),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2.0, 3.0),
                )
              ]),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  [

              Row(

                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Image.asset('assets/images/guess_logo.png',width: 120.0),
                  Text(' GUESS \n THE NUMBER',style: TextStyle (fontSize: 40.0,color: Colors.deepOrange,),),

                ],
              ),

              SizedBox(height: 40),
              SizedBox(
                  width: 400,
                  child: TextField()),
              SizedBox(height: 20),
               ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: (){
                    //
                  },
                ),


            ],
          ),
        ),
      ),
    );
  }
}

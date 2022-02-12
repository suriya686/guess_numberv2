import 'package:flutter/material.dart';

class nextPage extends StatefulWidget {
  const nextPage({Key? key}) : super(key: key);

  @override
  State<nextPage> createState() => _nextPageState();
}

class _nextPageState extends State<nextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/guess_logo.png',
                      width: 300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

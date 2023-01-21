import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;
  String _textAnswer = "";

  void _isItCorrect() {
    setState(() {
      if (_counter == 100) {
        _textAnswer = "You are absolutely right!";
      } else {
        _textAnswer = "Try again!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I love my cat!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("images/cat_pic.png"),
            ),
            const Text(
              'How much do you think I love my cat?',
            ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Slider(
              min: 0,
              max: 100,
              value: _counter,
              onChanged: (newValue) {
                setState(() {
                  _counter = newValue;
                });
              },
            ),
            Text(_textAnswer),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isItCorrect,
        // tooltip: 'Increment',
        child: const Icon(Icons.check),
      ),
    );
  }
}

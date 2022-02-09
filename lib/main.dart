import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

// Fibonoccci sequence using Function | Recursion
int find(var n) {
  if (n <= 1) {
    return n;
  } else {
    return find(n - 1) + find(n - 2);
  }
}

class MyAppState extends State<MyApp> {
  String data = "";
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fibonocci Sequence',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculate Fibonocci Sequence',
            style:
                TextStyle(fontFamily: 'Raleway', fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.amber.shade500,
        ),
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('assets/image.jpeg'), fit: BoxFit.cover),
          // ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('FIND THE FIBONOCCI SEQUENCE FOR A NUMBER',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  width: 250.0,
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: textController,
                    decoration:
                        const InputDecoration(hintText: 'Enter A Number'),
                  ),
                ),
                Text(
                  data,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: const Text('FIND'),
                  color: Colors.amber.shade700,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      var value = int.parse(textController.text);
                      if (value < 1) {
                        data = 'Enter a number greater than 0';
                      } else {
                        String output = "";

                        for (int i = 1; i <= value; ++i) {
                          if (i == value) {
                            output += find(i).toString();
                          } else {
                            output += find(i).toString() + ", ";
                          }
                        }
                        data =
                            'Fibonocci Sequence for ${textController.text} is $output';
                      }
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

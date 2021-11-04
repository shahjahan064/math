import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Math Kids Game")),
      body: Center(
        child: Image.network('https://th.bing.com/th/id/R.75bda797579a65bfab078735dd138ce7?rik=0Scigdz9YJoxBw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_66241.png&ehk=fNbTNC3LAGn%2fHxF3ErfHwjvf7qmtWAXUgPdJFrdiHbA%3d&risl=&pid=ImgRaw&r=0'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Text('Game'),
            ),
            ListTile(
              title: const Text('1 to 5'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new options();
                    }));
              },
            ),

            ListTile(
              title: const Text('1 to 10'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new options();
                    }));
              },
            ),
          ],
        ),
      ),

    );
  }
}
class options extends StatefulWidget {
  const options({Key? key}) : super(key: key);

  @override
  _optionsState createState() => _optionsState();
}

class _optionsState extends State<options> {
  int random = Random().nextInt((9)+1);
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Question'
          ),
        ),

        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _controller,
                cursorColor: Colors.lightGreenAccent,
                decoration: InputDecoration(
                    hintText: "Enter number here",
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(10.0)
                    )
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _controller2,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    hintText: "Enter number here",
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(10.0)
                    )
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary:  Colors.lightGreen,
                  ),
                  child: Text(
                      'Submit'
                  )),
              SizedBox(
                height: 30,
              ),
              Text("$random"
              ),
              SizedBox(
                height: 150,
              ),
              const Text(
                'Best Of Luck',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )

            ],
          ),
        )
    );
  }
}
/*
ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary:  Colors.lightGreen,
              ),
              child: Text(
            '2+4=?'
          ))
 */


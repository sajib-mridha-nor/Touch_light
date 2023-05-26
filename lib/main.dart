import 'package:flutter/material.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';

void main(List<String> args) {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/bl.jpg"),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.blue[600].withOpacity(.4), BlendMode.darken),
        )),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(),
            child: Center(
                // child: Image.asset(
                //   "lib/l.jpg",
                //   color: Colors.blue.withOpacity(0.4),
                //   colorBlendMode: BlendMode.dstOut,
                // ),
                ),
          ),
          Container(
            child: Transform.scale(
              scale: 2.5,
              child: RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: Switch(
                      activeColor: Color(0xffA3BEE0).withOpacity(0.9),
                      inactiveThumbColor: Color(0xffBDEE2F).withOpacity(0.6),
                      hoverColor: Color(0xff959993),
                      inactiveTrackColor: Colors.white.withOpacity(0.0),
                      value: isOn,
                      onChanged: (value) {
                        setState(() {
                          isOn = !isOn;
                          isOn ? Flashlight.lightOn() : Flashlight.lightOff();
                        });
                      }),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

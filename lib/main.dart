//ios最好采用cupertino这个包,其中也是提供了runapp()方法的,当然是用material也是没问题的.
//import 'package:flutter/cupertino.dart';
//Android最好采用包material-其中包含有runapp()方法
import 'package:flutter/material.dart';

void main() {
  runApp(myApp()
  );
}


class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "猫眼电影",
        home: Scaffold(
            appBar: AppBar(
              title: Text("阿里电影"),
            ),
            body: Center(
              child: myText(),
            )));
  }
}

class myText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(
      "英雄联盟",
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 30, color: Colors.red),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("风月同天"),
      ),
      body: AppContainer(),
    ));
  }
}

//下面我们就来实现一个鼠标的点击事件

class AppContainer extends StatefulWidget {
  @override
  State createState() {
    return StateContent();
  }
}

class StateContent extends State<AppContainer> {
  int num = 0;


//我们所需要的交互的小部件全部在该类中实现
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "点击我+",
                  style: TextStyle(fontSize: 40),
                ),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  //在此匿名函数中,来完成对于变量num的修改
                  print("发生了增加事件");
                  setState(() {
                    num++;
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  "点击我-",
                  style: TextStyle(fontSize: 40),
                ),
                color: Colors.yellow,
                textColor: Colors.blue,
                onPressed: () {
                  //在此匿名函数中,来完成对于变量num的修改
                  print("发生了减少事件");
                  setState(() {
                    num--;
                  });
                },
              ),
            ],
          ),

          //添加实时显示结果的文本控件Text
          Text(
            "累计:$num",
            style: TextStyle(fontSize: 40, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

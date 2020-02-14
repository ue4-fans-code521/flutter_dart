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
      body: SelfDefButtonWidget(),
//      body: ButtonWidget(),
//      body: textRichWidget(),
//      body: textWidget(),
//      body: AppContainer(),
    ));
  }
}

///下面是我们自定义的button组件
class SelfDefButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () => print("点击自定义button"),
        color: Colors.green,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.people,
              size: 30,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "天地异域",
              style: TextStyle(color: Colors.yellow, fontSize: 40),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        //给button添加圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

///自定义组件-包含常见的几种button小部件
class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //我们将几种常见的button进行一一的列出
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () => print("我是RaisedButton按钮"),
          ),
          FlatButton(
            child: Text("FlatButton"),
            onPressed: () => print("我是FlatButton按钮"),
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () => print("我是OutlineButton按钮"),
          ),
          FloatingActionButton(
            child: Text("FloatingActionButton"),
            onPressed: () => print("我是FloatingActionButton按钮"),
          )
        ],
      ),
    );
  }
}

///我们使用另外一个文本组件text.rich
class textRichWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: "《定风波》",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "苏轼",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
              style: TextStyle(fontSize: 20, color: Colors.green)),
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}

///text组件
class textWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "《定风波》 苏轼\n 莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      style: TextStyle(fontSize: 22, color: Color(0xffff00fff)),
      textAlign: TextAlign.center,

//      overflow: TextOverflow.ellipsis,
    ));
    //style: TextStyle(fontSize: 25, color: Colors.red),
    // style: TextStyle(color: Color(0xffff00ff), fontSize: 20),
    // textAlign: TextAlign.center,
    // maxLines: 2,
    // overflow: TextOverflow.ellipsis,
    //textScaleFactor: 2,
    // overflow:,       ))
  }
}

//下面我们就来实现一个鼠标的点击事件

class AppContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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

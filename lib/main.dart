import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("|山川异域  风月同天|"),
      ),
      body: TextFieldWidget(),
//      body: RoundCornerImageWidget(),
//      body: HomeContent(),
//      body: RoundCornerWidget(),
//      body: ClipOvalWidget(),
//      body: circleAvatarWidget(),
//      body: SelfDefImageLocalWidget(),
//      body: SelfDefImageNetWidget(),
//      body: SelfDefButtonWidget(),
//      body: ButtonWidget(),
//      body: textRichWidget(),
//      body: textWidget(),
//      body: AppContainer(),
    ));
  }
}

///下面我们来实现表单组件中的文本框
class TextFieldWidget extends StatefulWidget {
  @override
  State createState() {
    return TextFieldWidgetState();
  }
}

class TextFieldWidgetState extends State<TextFieldWidget> {
//我们在此定义一个文本控制器,把文本的变动交由TextEditingController进行管理
  final tc = TextEditingController();

//我们还需要对于onInit进行重写
  @override
  void initState() {
// TODO: implement initState
    super.initState();
//设置文本框中默认的值
    tc.text = "我本疏狂";
//我们为控制器添加监听方法,以便在状态发生改变的时候,回调其中的回调方法.
    tc.addListener((){print("===${tc.text}===");});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: "注册信息",
                icon: Icon(Icons.people),
                hintText: "请输入用户名:",
                border: OutlineInputBorder(borderSide: BorderSide(width: 5)),
                filled: true,
                fillColor: Colors.green),
            onChanged: (value) => print("实时更新:$value"),
            onSubmitted: (value) => print("提交数据:$value"),
            controller: tc,
          ),
        ],
      ),
    );
  }
}

///圆角图片的设置---使用cliprect实现
///注意:这里是使用的ClipRRect √ ----- 而不是ClipRect ×
class RoundCornerImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

///圆角头像的方案2---使用clipoval
class ClipOvalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200, //通过设置图片的大小,就可以改变圆角图片的大小
          height: 200,
        ),
      ),
    );
  }
}

///圆角头像-常见的有两种方式
///1.使用CircleAvatar
///2.使用clipoval---这种方式更为常见
class circleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
//        backgroundColor: Colors.red,
        backgroundImage: NetworkImage(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
        ),
        radius: 140, //设置radius就可以间接的设置图片的大小
        //添加一个图片---使用child
        child: Text(
          "令狐冲",
          style: TextStyle(color: Colors.yellow, fontSize: 20),
        ),
      ),
    );
  }
}

class SelfDefImageLocalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        color: Colors.purple,
        //给定网络图片
        child: Image.asset(
          "assets/image/tiger.jpg",
          alignment: Alignment.center,
          //是否在y轴上进行重复性的平铺图片,使其占满真个的container
          //repeat: ImageRepeat.repeatY,
          //fit: BoxFit.fill,//BoxFit.fill是一种以拉伸的方式占据整个屏幕的方式
          fit: BoxFit.cover, //等比例的缩放,直到铺满整个的container
        ),
      ),
    );
  }
}

///我们自定义使用图片(网络图片)的自定义的组件
class SelfDefImageNetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.purple,
        //给定网络图片
        child: Image.network(
          "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
          alignment: Alignment.center,
          //是否在y轴上进行重复性的平铺图片,使其占满真个的container
          //repeat: ImageRepeat.repeatY,
          //fit: BoxFit.fill,//BoxFit.fill是一种以拉伸的方式占据整个屏幕的方式
          fit: BoxFit.cover, //等比例的缩放,直到铺满整个的container
        ),
      ),
    );
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
              "山川异域",
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

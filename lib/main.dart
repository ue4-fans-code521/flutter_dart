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

//定义外围的整体的container
class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ContainerItem("Apple-001", "MacBook-P1",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          ContainerItem("Apple-002", "MacBook-P2",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
          ContainerItem("Apple-003", "MacBook-P3",
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        ],
      ),
    );
  }
}

//具体的有三个item组成的一个作为整体的item
class ContainerItem extends StatelessWidget {
//我们需要定义三个成员变量,然后由外部的父组件传递过来这三个参数，进行展示
  final String title;
  final String subtitle;
  final String imgurl;

//提供该类的构造函数
  ContainerItem(this.title, this.subtitle, this.imgurl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 3)),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.blue, fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Image.network(imgurl),
        ],
      ),
    );
  }
}

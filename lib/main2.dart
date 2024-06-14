import 'package:flutter/material.dart';
import 'package:quizapp/models/logic/mysql.dart';
import 'package:quizapp/log_sign.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var db = new Mysql();
  var user = '';

  void _getuser() {
    db.getConnection().then((conn) {
      String sql = 'select user from user.quizapp where id = 0;';
      conn.query(sql).then((results) {
        for(var row in results){
          setState(() {
            user = row[0];
          });
        }
      });
      conn.close();
    });
  }

  @override
  Widget build(BuildContext context) {
  

  
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'user:',
            ),
            Text(
              '$user',
              // style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getuser,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


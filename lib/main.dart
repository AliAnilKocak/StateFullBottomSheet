import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<Null> _incrementCounter(StateSetter updateState) async {
    updateState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StatefulBuilder(builder: (context, state) {
              return Center(
                child: Column(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          _incrementCounter(state);
                        },
                        child: new Text('$_counter',style: TextStyle(fontSize: 33),)),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        _incrementCounter(state);
                      },
                      child: Text("+",style: TextStyle(color: Colors.white,fontSize: 32),),
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet();
        },
        child: Icon(Icons.keyboard_arrow_up),
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, state) {
            return Center(
              child: Column(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        _incrementCounter(state);
                      },
                      child: new Text('$_counter',style: TextStyle(fontSize: 33),)),
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      _incrementCounter(state);
                    },
                    child: Text("+",style: TextStyle(color: Colors.white,fontSize: 32),),
                  )
                ],
              ),
            );
          });
        }).whenComplete(() {
      setState(() {});
    });
  }

}

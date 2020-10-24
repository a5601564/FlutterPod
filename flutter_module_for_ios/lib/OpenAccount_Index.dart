import 'package:flutter/material.dart';
class OpenAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('App Name'),
          ),
        body:
          new IconButton(
            icon: const Icon(Icons.insert_emoticon),
            onPressed:(){
              showDialog<Null>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                      return new AlertDialog(
                          title: new Text('标题'),
                        content: new SingleChildScrollView(
                              child: new ListBody(
                                  children: <Widget>[
                                      new Text('内容 1'),
                                      new Text('内容 2'),
                                  ],
                              ),
                          ),
                          actions: <Widget>[
                              new FlatButton(
                                  child: new Text('确定'),
                                  onPressed: () {
                                      Navigator.of(context).pop();
                                  },
                              ),
                          ],
                      );
                  },
              ).then((val) {
                  print(val);
              });
            },
            iconSize: 48.0,
            color: const Color(0xFF000000),
          ),
    
      );
  }
}


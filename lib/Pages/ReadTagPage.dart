
import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart' as NFCM;


class ReadTag extends StatefulWidget {
  @override
  _ReadTagState createState() => _ReadTagState();
}

NFCM.NfcManager manager;

class _ReadTagState extends State<ReadTag> {

  TextEditingController controller;
  @override
  void initState() {
    super.initState();
    manager=NFCM.NfcManager();
    controller = new TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Read Key')),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('Read Tag'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RaisedButton(
                  child: Text('Read Tag'),
                  onPressed: ()  {
                    Navigator.pushNamed(context,
                      '/confirmPage',
                    );
                    },
                )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RaisedButton(
                  child: Text("Add tag's key with scan"),
                  onPressed: () {manager.addReadable();},
                )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RaisedButton(
                  child: Text('Create Log'),
                  onPressed: () {manager.logRegister();},
                )
                ],
              ),
            ],
          )

      ),

    );
  }
}


class ConfirmPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    _ConfirmPageState createState() => _ConfirmPageState();
  }

}


class _ConfirmPageState extends State<ConfirmPage> {

  int i;



  @override
  Widget build(BuildContext context) {
    var currentColor;
    var text;

    print(i);
    switch (i){
      case 1:
        currentColor = Colors.green;
        text = 'You can read this Tag!';
        break;

      case 0:
        currentColor = Colors.yellowAccent;
        text = 'You can read this Tag!''WARNING: \n You are not authorized to read this key \n After 3 attempts the content on the tag will be deleted';
        break;

      case -1:
        currentColor = Colors.red;
        text = 'WARNING: \n You are not authorized to read this key!!';
        break;
    }

    return Material(
      color: Colors.green,
    );
    /*return Scaffold(
      body: Center(
        child: Container(
          color: currentColor,
          child: Container(
            child:(i==null)?CircularProgressIndicator(value: 25,): Text(text),
          ),
        ),
      ),
    );*/

  }

}
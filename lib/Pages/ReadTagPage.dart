
import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart' as NFCM;


class ReadTag extends StatefulWidget {
  @override
  _ReadTagState createState() => _ReadTagState();
}

class ScreenArguments{
  final int check;
  ScreenArguments(this.check);
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

  void read() async {
    int i = await manager.canRead();
    Navigator.pushNamed(context,
        '/confirmPage',
        arguments: ScreenArguments(i)
    );
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
                    read();
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
    _ConfirmPageState createState() => _ConfirmPageState();
}


class _ConfirmPageState extends State<ConfirmPage> {

  @override
  void initState () {
    manager=NFCM.NfcManager();
  }


  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute
        .of(context)
        .settings
        .arguments;
    var currentColor;
    var text;

    print(args.check);
    switch (args.check){
      case 1:
        currentColor = Colors.green;
        text = 'You can read this Tag!';
        break;

      case 0:
        currentColor = Colors.yellowAccent;
        text = 'WARNING: \nYou are not authorized to read this key \nAfter 3 attempts the content on the tag will be deleted';
        break;

      case -1:
        currentColor = Colors.red;
        text = 'WARNING: \n You are not authorized to read this key!!';
        break;
    }





    return Scaffold(
      backgroundColor: currentColor,
      body: Center(
        child: Container(
          child: Container(
            child:(args.check==null)?CircularProgressIndicator(value: 25,): Text(text),
          ),
        ),
      ),
    );

  }

}
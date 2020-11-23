import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart' as NFCM;

class ScreenArguments{
  final int check;
  ScreenArguments(this.check);
}

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

  void read() async {
    int i = await manager.canRead();
    Navigator.pushNamed(context,
        ConfirmPage.routeName,
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
                    //manager.canRead();
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
  static const routeName = '/extractArguments';
  @override
  State<StatefulWidget> createState() {
    _ConfirmPageState createState() => _ConfirmPageState();
  }

}
class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute
        .of(context)
        .settings
        .arguments;

    print(args.check);
    if (args.check == 1) {
      return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Container(
            child: Text('You can read this Tag!'),
          ),
        ),
      );
    } else if (args.check == 0) {
      return Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Center(
          child: Container(
            child: Text(
                'WARNING: \n You are not authorized to read this key \n After 3 attempts the content on the tag will be deleted'),
          ),
        ),
      );
    } else if (args.check == -1) {
      return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Container(
            child: Text(
                'WARNING: \n You are not authorized to read this key!!'),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black87,
    );

  }
}
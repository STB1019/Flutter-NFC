import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart' as NFCM;

class ReadTag extends StatefulWidget {
  @override
  _ReadTagState createState() => _ReadTagState();
}

class ScreenArguments {
  final int check;

  ScreenArguments(this.check);
}

NFCM.NfcManager manager;

class _ReadTagState extends State<ReadTag> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    manager = NFCM.NfcManager();
    controller = new TextEditingController();
  }

  void read() async {
    int i = await manager.canRead();
    Navigator.pushNamed(context, '/confirmPage', arguments: ScreenArguments(i));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.grey,
            pinned: true,
            centerTitle: true,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            shadowColor: Colors.black.withOpacity(0.80),
            title: Text("NFC",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([

            Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  color: Colors.white70,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      read();
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "Read Tag",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),

                    ),
                  )),
            ),
            Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  color: Colors.white70,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      manager.addReadable();
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "Abil Tag",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                  )),
            ),
          ]))
        ],
      ),
    );
  }
}

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  void initState() {
    manager = NFCM.NfcManager();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    var currentColor;
    var text;

    print(args.check);
    switch (args.check) {
      case 1:
        currentColor = Colors.green;
        text = 'You can read this Tag!';
        break;

      case 0:
        currentColor = Colors.yellowAccent;
        text =
            'WARNING: \nYou are not authorized to read this key \nAfter 3 attempts the content on the tag will be deleted';
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
            child: (args.check == null)
                ? CircularProgressIndicator(
                    value: 25,
                  )
                : Text(text),
          ),
        ),
      ),
    );
  }
}

/*
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[

          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.55),
                    spreadRadius: 3,
                    blurRadius: 1000,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/addkey');
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "Read Tag",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.55),
                    spreadRadius: 3,
                    blurRadius: 1000,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                     read();
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "TagManager",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 30),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.55),
                    spreadRadius: 3,
                    blurRadius: 1000,
                    offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                     manager.addReadable();
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                      child: Text(
                        "Abil Tag",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  )),
            ),
          ]))
        ],
      ),
    );
  }

_______________________________________

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
            ],
          )

      ),

    );

 */

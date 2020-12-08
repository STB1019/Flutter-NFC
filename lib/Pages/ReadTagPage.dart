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

  void read(BuildContext context) async {
    int i = await manager.canRead();
    //Navigator.pushNamed(context, '/confirmPage', arguments: ScreenArguments(i));
    allert(context, i: i);
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
            title: Text(
              "NFC",
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
                    read(context);
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
                    abilTag(context);
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

void abilTag(BuildContext context) async{
  bool check = await manager.addReadable();
  allert(context, check: check);

}


Future<Widget> allert(BuildContext context, {int i, bool check}){
  String text="Tag reading error!\nTry reading the tag again!";

  if(check != null){
    if (check==true){
      text="Tag Enabled";
    }else{
      text="Error!";
    }
  }
  if(i != null){
    switch (i) {
      case 1:
        text = 'You can read this Tag!';
        break;

      case 0:
        text = 'WARNING:\nYou are not authorized to read this key\nAfter 3 attempts this tag will be locked';
        break;

      case -1:
        text = 'WARNING:\nYou are not authorized to read this key!!';
        break;
    }
  }
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text,
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
          ),
        );
      });
}



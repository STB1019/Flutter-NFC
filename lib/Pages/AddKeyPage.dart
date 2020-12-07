import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart' as NFCM;

class AddKey extends StatefulWidget {
  @override
  _AddKeyState createState() => _AddKeyState();
}

NFCM.NfcManager manager;

class _AddKeyState extends State<AddKey> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    manager = NFCM.NfcManager();
    controller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NFC',
          style: TextStyle(color: Colors.black),
        ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('Add new readable key:'),
              ),
              Flexible(
                  child: TextField(
                controller: controller,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: () {
                      manager.addReadableId(controller.value.text);
                      print(controller.value.text);
                    },
                  )
                ],
              )
            ],
          )),
    );
  }
}

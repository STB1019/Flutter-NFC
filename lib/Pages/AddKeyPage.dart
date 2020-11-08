import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart';

class AddKey extends StatefulWidget {
  @override
  _AddKeyState createState() => _AddKeyState();
}

class _AddKeyState extends State<AddKey> {

  NfcManager manager;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    manager = new NfcManager();
    controller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Key')),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('Add new readable key:'),
              ),
              Flexible(
                  child: TextField(controller: controller,)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RaisedButton(
                  child: Text('Login'),
                  onPressed: () {manager.addReadableId(controller.value.text); print(controller.value.text);},
                )
                ],
              )
            ],
          )

      ),

    );
  }
}
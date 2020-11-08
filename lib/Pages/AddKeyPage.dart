import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
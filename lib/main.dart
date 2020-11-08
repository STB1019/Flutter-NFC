import 'package:flutter/material.dart';
import 'NfcKeyManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nfc",
      theme: ThemeData(primarySwatch: Colors.blue),


    );
  }

}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

}


class AddKey extends StatelessWidget {

  AddKey(NfcManager manager);

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
              child: TextField()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[RaisedButton(
                child: Text('Login'),
                  onPressed: () => {}, //manager.addReadable(),
                )
              ],
            )
          ],
        )

      ),

    );
  }

}

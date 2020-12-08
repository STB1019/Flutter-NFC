import 'package:flutter/material.dart';
import 'package:nfc_app/NfcKeyManager.dart' as NFCM;

class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}

NFCM.NfcManager manager;
List<String> items=new List<String>();


class _TagListState extends State<TagList> {

  @override
  void initState() {
    super.initState();
    manager=NFCM.NfcManager();
  }

  @override
  Widget build(BuildContext context) {
    items = manager.getLog();
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }


}


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


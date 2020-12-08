import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_app/Pages/ReadTagPage.dart';
import 'package:nfc_app/Pages/TagListPage.dart';

import 'NfcKeyManager.dart' as NFCM;
import 'Pages/AddKeyPage.dart';

void main() => runApp(MyApp());
NFCM.NfcManager manager = NFCM.NfcManager();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainRouting(),
    );
  }

  //qui aggiungo le route che posso raggiungere
  Map<String, WidgetBuilder> mainRouting() {
    return {
      '/': (context) => HomePage(),
      '/addkey': (context) => AddKey(),
      '/readTag': (context) => ReadTag(),
      '/listTag': (context) => TagList(),
    };
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
              expandedHeight: 200.0,
              shadowColor: Colors.black.withOpacity(0.80),
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'NFC',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  centerTitle: true,
                  background: Image.asset(
                    'assets/images/nfc.png',
                    fit: BoxFit.fill,
                  ))),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.all(10),
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
                    Navigator.pushNamed(context, '/readTag');
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: Text(
                      "ReadMode",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
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
                    Navigator.pushNamed(context, '/addkey');
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
                  )),
            ),
            Container(margin: EdgeInsets.all(10)),
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
                    Navigator.pushNamed(context, '/listTag');
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: Text(
                      "Log List",
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

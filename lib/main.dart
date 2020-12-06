import 'package:flutter/material.dart';
import 'package:nfc_app/Pages/ReadTagPage.dart';
import 'package:nfc_app/Pages/TagListPage.dart';
import 'NfcKeyManager.dart' as NFCM;
import 'Pages/AddKeyPage.dart';

void main() => runApp(MyApp());
NFCM.NfcManager manager = NFCM.NfcManager();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainRouting(),
    );
  }



  //qui aggiungo le route che posso raggiungere
  Map<String, WidgetBuilder> mainRouting(){
    return {
      '/': (context) => HomePage(),
      '/addkey': (context) => AddKey(),
      '/readTag': (context) => ReadTag(),
      '/listTag': (context) => TagList(),
      '/confirmPage': (context) => ConfirmPage(),
    };
  }
}



class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.tealAccent,
              pinned: true,
              centerTitle: true,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              expandedHeight: 200.0,
              shadowColor: Colors.black.withOpacity(0.80),
              flexibleSpace: FlexibleSpaceBar(
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 100),
                      //opacity: top == 50.0 ? 1.0 : 0.0,
                      opacity: 0.60,
                      child: Text(
                        'NFC',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      )),
                  centerTitle: true,
                  background: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGOJ8ZymeJGTUhFtdsITUmgx_4vW5dVeRREQ&usqp=CAU',
                    fit: BoxFit.cover,
                  ))),
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
                            "ReadMode",
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
                          Navigator.pushNamed(context, '/readTag');
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
                        ),
                      )),
                ),
              ]))
        ],
      ),
    );
  }
}






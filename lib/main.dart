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
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RaisedButton(
                  child: Text('Add key'),
                  onPressed: () { Navigator.pushNamed(context, '/addkey');},
                )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RaisedButton(
                  child: Text('Read Tag'),
                  onPressed: () {Navigator.pushNamed(context, '/readTag');},
                )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RaisedButton(
                  child: Text('Log list'),
                  onPressed: () {Navigator.pushNamed(context, '/listTag');},
                )
                ],
              ),



            ],
          )

      ),
    );
  }
}






/*
child: RaisedButton(
          child: Text('Add new Key whit id'),
          onPressed: () {
            Navigator.pushNamed(context, '/addkey');
          },
        ),




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
    return MaterialApp(
        home: Scaffold(
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
                  child: TextField(
                controller: controller,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Login'),
                    onPressed: () {
                      manager.addReadableId(controller.value.text);
                      print(controller.value.text);
                    },
                  ),
                  RaisedButton(
                    child: Text('Crea un log'),
                    onPressed: () {
                      manager.logRegister();
                    },
                  ),
                  RaisedButton(
                    child: Text('printLog'),
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(controller.value.text),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),



            ],

          )),
    ));
  }
}*/

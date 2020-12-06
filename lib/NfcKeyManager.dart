//import 'package:nfc_in_flutter/nfc_in_flutter.dart'; vecchia libreria
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NfcManager {


//SINGLETON
  static final NfcManager _instance = new NfcManager._();
  NfcManager._(); //metodo costruttore privato

  factory NfcManager() => _instance; //produce oggetti uguali

  static NfcManager _nf; //alias

  Set<String> availableKey = new Set();
  Set<String> deniedKey = new Set();
  List<String> log = new List();
  var attempts = new Map<String, int>();


  //funzione per creare dei log per i tag, così provo gli stream
  //fatto con la vecchia libreria, non mi serve più per ora
  /*void logRegister(){
    Stream<NDEFMessage> stream = NFC.readNDEF();

    stream.listen((NDEFMessage message) {
      log.add("NFC key: " + message.tag.id);
      print("NFC key: " + message.tag.id);
      print(message.id);
      print(message.tag.id);
    });
  }*/


  String oneLog(){
    return log.first;
  }

  //getter log
  List getLog(){
    return log;
  }



 //metodo di aggiunt tag tramite scansione
  void addReadable() async {
    NFCTag tag = await FlutterNfcKit.poll();
    availableKey.add(tag.id);
  }

  //metodo di aggiunta tag tramite id
  void addReadableId(String s) async {
    availableKey.add(s);
  }

  /*
  Metodo che ritorna:
  -> 1 se posso leggere il tag
  -> 0 se ho provato a leggere un tag ma non ho esaurito i "3 tentativi"
  -> -1 se sto provando a leggere un tag che ho bloccato in precedenza
   */
  Future<int> canRead() async {
    try {
      NFCTag tag = await FlutterNfcKit.poll();
      log.add("NFC key: " + tag.id);
      

      //Se posso leggere questo tag allora ritorno 1

      if (availableKey.contains(tag.id)==true) {
        availableKey.remove(tag.id);
        return 1;
      }

      //Se la chiave è contenuta nelle chiavi "non leggibili" allora ritorno -1
      if (deniedKey.contains(tag.id)==true) {
        return -1;
      }

      /* se non rientro in nessuna delle due casistiche precedenti allora ho 2 possibilità:
    1) Se il tag è presente nella mia mappa che contiene i tentativi di lettura:
          a) l'ho letto meno di tre volte -> incremento il counter delle volte che l'ho letto nella mappa
          b) oppure se l'ho letto per la terza volta -> Lo aggiungo alla chiavi che non sono abilitato a leggere e dovrei eliminare il contenuto dal tag (PROBLEMA)

    2) Non avendo mai letto questo tag che non sono abilitato a leggere devo inserirlo nella mia mappa
     */

      if (attempts.containsKey(tag.id)==true) {
        int numberAttempts = attempts[tag.id];
        print(numberAttempts);
        numberAttempts = numberAttempts + 1;
        if (numberAttempts < 3) {
          attempts.update(tag.id, (value) => numberAttempts);
          return 0;
        } else {
          print('Non più leggibile');
          //TODO: ELIMINAZIONE DEL CONTENUTO DAL TAG
          deniedKey.add(tag.id);
          attempts.remove(tag.id); //lo elimino dalla lista dei tentativi, se un giorno riabilitassi e bloccassi questo tag, avrà altri 3 tentativi
          return -1;
        }
      } else {
        attempts[tag.id] = 0;
      }

      return null;
    } catch (err) {
      print("error: $err");
      return null;
    }
  }

  /**Future<void> write() async {
    NDEFMessage newMessage = NDEFMessage.withRecords(
        new List<NDEFRecord>()
    );
    
    Stream<NDEFTag> stream = NFC.writeNDEF(newMessage);

    stream.listen((NDEFTag tag) {
      print("wrote to tag");
    });
  }*/






}

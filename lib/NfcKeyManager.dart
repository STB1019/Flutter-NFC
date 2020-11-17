import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class NfcManager {
  Set<String> availableKey = new Set();
  Set<String> deniedKey = new Set();
  List<String> log = new List();
  var attempts = new Map<String, int>();

  //funzione per creare dei log per i tag, così provo gli stream
  void logRegister(){
    Stream<NDEFMessage> stream = NFC.readNDEF();

    stream.listen((NDEFMessage message) {
      log.add("NFC key: " + message.tag.id);

    });
  }

  String esisto(){
    return "esisto";
  }

  //getter log
  List getLog(){
    return log;
  }


 //metodo di aggiunt tag tramite scansione
  void addReadable() async {
    NDEFMessage message = await NFC.readNDEF(once: true).first;
    availableKey.add(message.id);
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
      NDEFMessage message = await NFC.readNDEF(once: true).first;

      //Se posso leggere questo tag allora ritorno 1
      if (availableKey.contains(message.id)) {
        return 1;
      }

      //Se la chiave è contenuta nelle chiavi "non leggibili" allora ritorno -1
      if (deniedKey.contains(message.id)) {
        return -1;
      }

      /* se non rientro in nessuna delle due casistiche precedenti allora ho 2 possibilità:
    1) Se il tag è presente nella mia mappa che contiene i tentativi di lettura:
          a) l'ho letto meno di tre volte -> incremento il counter delle volte che l'ho letto nella mappa
          b) oppure se l'ho letto per la terza volta -> Lo aggiungo alla chiavi che non sono abilitato a leggere e dovrei eliminare il contenuto dal tag (PROBLEMA)

    2) Non avendo mai letto questo tag che non sono abilitato a leggere devo inserirlo nella mia mappa
     */

      if (attempts.containsKey(message.id)) {
        int numberAttempts = attempts.values as int;
        numberAttempts = numberAttempts + 1;
        if (numberAttempts < 3) {
          attempts.update(message.id, (value) => numberAttempts);
          return 0;
        } else {
          //ELIMINAZIONE DEL CONTENUTO DAL TAG
          deniedKey.add(message.id);
          return -1;
        }
      } else {
        attempts[message.id] = 0;
      }

      return null;
    } catch (err) {
      print("error: $err");
      return null;
    }
  }

  //ancora da implementare
  void delete(NDEFMessage message){
    message.tag.delete(message);
  }



}

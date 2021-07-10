import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String id = "water_level";

  final CollectionReference waterLevelCollection =
      FirebaseFirestore.instance.collection('waterlevel');

  Future updateWaterLevel(double value) async {
    return await waterLevelCollection.doc(id).set({'waterlevel': value});
  }

  Future getwaterLevel() async {
    List list = [];
    try {
      await waterLevelCollection
          .get()
          .then((querysnapshot) => querysnapshot.docs.forEach((element) {
                list.add(element.data);
              }));
      return list;
    } catch (e) {
      print(e.toString());
      return null;
    }
    //return waterLevelCollection.doc(id).get;
  }
}

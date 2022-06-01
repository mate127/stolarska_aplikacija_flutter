import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String id;
  DatabaseService({required this.id});
  final CollectionReference adCollection =
      FirebaseFirestore.instance.collection('ads');
  Future createNewAd(String title, String description) async {
    return await adCollection.doc().set({
      'title': title,
      'descrpiton': description,
    });
  }
}

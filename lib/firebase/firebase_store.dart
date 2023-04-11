import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/favorite_model.dart';

class StoreFirebase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<bool> putFavourate(id, Favorite favorite) async {
    favorite.id = id;
    return await firebaseFirestore
        .collection("Favourate")
         .doc(favorite.id.toString())
        .set(favorite.toFirestore())
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
  Future<bool> deleteFavourate(id, Favorite favorite) async {
    favorite.id = id;
    return await firebaseFirestore
        .collection("Favourate")
        .doc(favorite.id.toString())
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  

}

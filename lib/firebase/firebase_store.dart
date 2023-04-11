import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/product_model.dart';

class StoreFirebase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  

  

  

  Future<bool> putFavourate(id, Product product) async {
    product.userId1 = id;
    return await firebaseFirestore
        .collection("Favourate")
         .doc(product.id.toString())
        .set(product.toJson())
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
  Future<bool> deleteFavourate(id, Product product) async {
    product.userId1 = id;
    return await firebaseFirestore
        .collection("Favourate")
        .doc(product.id.toString())
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  

}

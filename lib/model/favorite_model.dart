import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  final String name;
  final String imageUrl;
  final String description;
   String id;

  Favorite({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.id,
  });

  factory Favorite.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Favorite(
      name: data['name'],
      imageUrl: data['imageUrl'],
      description: data['description'],
      id: doc.id,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:students_portal/models/character.dart';

class FirestoreServices {

  static final ref = FirebaseFirestore.instance
    .collection('characters')
    .withConverter( 
      fromFirestore: Character.fromFirestore,
      toFirestore: (Character c, _) => c.tofirestore()
    );
  //add character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

   //get character
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }
  //update a character
  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      'skills': character.skills.map((s) => s.id).toList(),
      'isFav': character.isfav,
    });
 }

 //delete character
 static Future<void> deleteCharacter(Character character) async {
  await ref.doc(character.id).delete();
 }
}
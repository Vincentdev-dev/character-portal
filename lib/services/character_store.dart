import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students_portal/models/character.dart';
import 'package:students_portal/models/vocation.dart';
import 'package:students_portal/services/firestore_services.dart';

class CharacterStore extends ChangeNotifier {
  
  final List<Character> _characters = [

  Character(id: '1', name: 'Pau', vocation: Vocation.wizard, slogan: 'Envizzy'),
  Character(id: '2', name: 'Vincent', vocation: Vocation.junkie, slogan: 'Envizzy'),
  Character(id: '3', name: 'Onyeka', vocation: Vocation.raider, slogan: 'Envizzy'),
  Character(id: '4', name: 'Chukwumee', vocation: Vocation.ninja, slogan: 'Envizzy'),
  ];

  get characters => _characters;

  //ad character
  void addcharacter(Character character) {
    FirestoreServices.addCharacter(character);
    
    _characters.add(character);
    notifyListeners();
  }

  Future<void> saveCharacter(Character character) async {
    await FirestoreServices.addCharacter(character);
    return;
  }

  //delete character
  void removeCharacter(Character character) async {
    await FirestoreServices.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }
 
  
  //initially fetch
  void fetchCharacterOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreServices.getCharactersOnce();
    
      for(var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }
}

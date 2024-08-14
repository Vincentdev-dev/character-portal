import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:students_portal/models/skill.dart';
import 'package:students_portal/models/stats.dart';
import 'package:students_portal/models/vocation.dart';

class Character with Stats{


Character({
  required this.name, required this.slogan, required this.id, required this.vocation
});

final Set<Skill> skills ={};
final Vocation vocation;
final String name;
final String slogan;
final String id;
bool _isFav = false;

//getter
get isfav => _isFav;

//methods
void toggleIsFav() {
_isFav = !_isFav;
}

void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
//character to firsstore
Map<String, dynamic> tofirestore() {
  return {
    "name": name,
    "slogan": slogan,
    "isFav": _isFav,
    "vocation": vocation.toString(),
    "skills": skills.map((s) => s.id).toList(),
    "stats": statsAsMap,
    "points": points,
  };
}
//character from firestore
factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic >> snapshot, 
    SnapshotOptions? options
){

  //get data from snapshot
  final data = snapshot.data()!;

  //make character instance
  Character character = Character(
    name: data['name'], 
    slogan: data['slogan' ], 
    id: snapshot.id, 
    vocation: Vocation.values.firstWhere((v) => v.toString() == data['vocation']),
    );

  //update skills
  for (String id in data['skills']) {
    Skill skill = allSkills.firstWhere((element) => element.id == id);
    character.updateSkills(skill);
  }

  //IS FAV
  if(data['isFav'] == true) {
    character.toggleIsFav();
  }

  //
  character.setStats(
    points: data['points'], 
    stats: data['stats']);
    return character;


}

}

// DUMMY CHARACTER DATA

List<Character> characters = [
  Character(id: '1', name: 'Paul', vocation: Vocation.wizard, slogan: 'Envizzy'),
  Character(id: '2', name: 'Vincent', vocation: Vocation.junkie, slogan: 'Envizzy'),
  Character(id: '3', name: 'Onyeka', vocation: Vocation.raider, slogan: 'Envizzy'),
  Character(id: '4', name: 'Chukwumee', vocation: Vocation.ninja, slogan: 'Envizzy'),
]; 
import 'package:students_portal/models/vocation.dart';

class Skill {
  final String id;
  final String name;
  final String image;
  final Vocation vocation;

  Skill({ 
    required this.id, 
    required this.name, 
    required this.image,
    required this.vocation, 
  });
}

final List<Skill> allSkills = [
  // algo wizard skills
  Skill(id: '1', name: 'Brute Force Bolt', image: 'bf_bolt.jpg', vocation: Vocation.wizard),
  Skill(id: '2', name: 'Recursive Wave', image: 'r_wave.jpg', vocation: Vocation.wizard),
  Skill(id: '3', name: 'Hash Beam', image: 'h_beam.jpg', vocation: Vocation.wizard),
  Skill(id: '4', name: 'Backtrack', image: 'backtrack.jpg', vocation: Vocation.wizard),

  // terminal raider skills
  Skill(id: '5', name: 'Lethal Touch', image: 'bf_bolt.jpg', vocation: Vocation.raider),
  Skill(id: '6', name: 'Sudo Blast', image: 'r_wave.jpg', vocation: Vocation.raider),
  Skill(id: '7', name: 'Full Clear', image: 'h_beam.jpg', vocation: Vocation.raider),
  Skill(id: '8', name: 'Support Shell', image: 'backtrack.jpg', vocation: Vocation.raider),

  // code junkie skills
  Skill(id: '9', name: 'Infinite Loop', image: 'bf_bolt.jpg', vocation: Vocation.junkie),
  Skill(id: '10', name: 'Type Cast', image: 'r_wave.jpg', vocation: Vocation.junkie),
  Skill(id: '11', name: 'Encapsulate', image: 'h_beam.jpg', vocation: Vocation.junkie),
  Skill(id: '12', name: 'Copy & Paste', image: 'backtrack.jpg', vocation: Vocation.junkie),

  // ux ninja skills
  Skill(id: '13', name: 'Gamify', image: 'bf_bolt.jpg', vocation: Vocation.ninja),
  Skill(id: '14', name: 'Heat Map', image: 'r_wave.jpg', vocation: Vocation.ninja),
  Skill(id: '15', name: 'Wireframe', image: 'h_beam.jpg', vocation: Vocation.ninja),
  Skill(id: '16', name: 'Dark Pattern', image: 'backtrack.jpg', vocation: Vocation.ninja),
];
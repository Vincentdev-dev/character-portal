import 'package:flutter/material.dart';
import 'package:students_portal/models/character.dart';
import 'package:students_portal/models/skill.dart';
import 'package:students_portal/shared/styled_text.dart';
import 'package:students_portal/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {

  late List<Skill> availableSkills; 
  late Skill selectedSkill;

  @override
  void initState() {

    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();
    
    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills[0];

    }
    if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [
            const StyledHeading('Choose an active skill'),
            const StyledText('Skills are essential to your vocation'),
            const SizedBox(height: 20,),

            Row(
              children: 
               availableSkills.map((skill) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(4),
                  color: skill == selectedSkill ? Colors.yellow : Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.character.updateSkills(skill);
                        selectedSkill = skill;
                      });
                    },
                    child: Image.asset('assets/img/skills/${skill.image}',
                    width: 60,
                    ),
                  )
                );
               }).toList(),
                  
               
            ),
            const SizedBox(height: 10,),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
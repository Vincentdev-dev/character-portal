import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_portal/models/character.dart';
import 'package:students_portal/screens/profile/skill_list.dart';
import 'package:students_portal/screens/profile/stats_table.dart';
import 'package:students_portal/services/character_store.dart';
import 'package:students_portal/shared/styled_button.dart';
import 'package:students_portal/shared/styled_text.dart';
import 'package:students_portal/theme.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
    
    });

    final Character character;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            //basic info
            Container(
              padding: const EdgeInsets.all(10),
              color: AppColors.secondaryColor.withOpacity(0.4),
              child: Row(
                children: [
                  Image.asset('assets/img/vocation/${character.vocation.image}',
                  width: 120,
                  height: 120,
                  ),
                 const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //weapon and ability
            const SizedBox(height: 20,),
            Center(
              child: Icon(Icons.code,
              color: AppColors.primaryColor,),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10,),
                    const StyledHeading('Waepon of Choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10,),
                    const StyledHeading('Ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),),

            //stats and skills
            Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.2)
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character)
                ],
              ),
              
            ),
            //save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false)
                .saveCharacter(character);


                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const StyledHeading('Character was saved'),
                  showCloseIcon: true,
                  duration: const Duration(seconds: 2),
                  backgroundColor: AppColors.secondaryColor,
                ));
              }, 
              child: const StyledHeading('Save Character'),
              ),
              const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
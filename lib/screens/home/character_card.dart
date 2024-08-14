import 'package:flutter/material.dart';
import 'package:students_portal/models/character.dart';
import 'package:students_portal/screens/profile/profile.dart';
import 'package:students_portal/shared/styled_text.dart';
import 'package:students_portal/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.characters, {super.key});

  final Character characters;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Image.asset('assets/img/vocation/${characters.vocation.image}', 
              width: 80,
              fit: BoxFit.contain,
              
            ),

            const SizedBox(width: 20),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(characters.name),
                StyledText(characters.vocation.title),
              ]
            ),
          const Expanded(
            child: SizedBox()),
          IconButton(
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) =>  Profile(character: characters),
                ));
            }, 
            icon: Icon(Icons.arrow_back,
            color: AppColors.textColor,
            ))
        ],
      ),
      )
    );
  }
}
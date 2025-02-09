import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_portal/models/character.dart';
import 'package:students_portal/screens/create/create.dart';
import 'package:students_portal/screens/home/character_card.dart';
import 'package:students_portal/services/character_store.dart';
import 'package:students_portal/shared/styled_button.dart';
import 'package:students_portal/shared/styled_text.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false)
    .fetchCharacterOnce();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Your subjects"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child:  Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        key: ValueKey(value.characters[index].id),
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(context, listen: false)
                            .removeCharacter(value.characters[index]);
                        },
                        child: CharacterCard(value.characters[index]));
                    }
                  );
                }
              ),
            ),
            StyledButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (ctx) => const CreateScreen(),
                ));
              }, 
              child: const StyledHeading("create new subject"))
            
          ],
        ),
      ),
    );
  }
}
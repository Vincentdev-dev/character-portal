import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_portal/models/character.dart';
import 'package:students_portal/models/vocation.dart';
import 'package:students_portal/screens/create/vocation_card.dart';
import 'package:students_portal/screens/home/home.dart';
import 'package:students_portal/services/character_store.dart';
import 'package:students_portal/shared/styled_button.dart';
import 'package:students_portal/shared/styled_text.dart';
import 'package:students_portal/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

 final _nameController = TextEditingController();
 final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  //handling vocation selectioins
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  //sumbit handler
  void handleSumbit() {
    if (_nameController.text.trim().isEmpty) {
     //show error dialogue

     showDialog(context: context, builder: (ctx) {
      return AlertDialog(
        backgroundColor: AppColors.secondaryAccent,
        surfaceTintColor: Colors.transparent,
        title: const StyledHeading("Missing Character Name", ),
        content: const StyledText("Every Great Character deserves a Good Name"),
        actions: [
          StyledButton(
            onPressed: () {
              Navigator.pop(ctx);
            }, 
            child: const StyledText("CLOSE"))
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
     } );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      //show error dialogue
      showDialog(context: context, builder: (ctx) {
      return AlertDialog(
        backgroundColor: AppColors.secondaryAccent,
        surfaceTintColor: Colors.transparent,
        title: const StyledHeading("Missing Character Slogan", ),
        content: const StyledText("A slogan is your motive to live"),
        actions: [
          StyledButton(
            onPressed: () {
              Navigator.pop(ctx);
            }, 
            child: const StyledText("CLOSE")
            )
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
     } );
      return;
    }
   
  

   Provider.of<CharacterStore>(context, listen: false)
    .addcharacter(Character(
    name: _nameController.text.trim(),
    slogan: _sloganController.text.trim(),
    vocation: selectedVocation,
    id: uuid.v4(),

   ));

    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => const Home(),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Character Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor)
              ),
              const Center(
                child: StyledHeading('Welcome to vin-dev'),
              ),
              const Center(
                child: StyledText('create a name and slogan for yourself'),
              ),
              const SizedBox(height: 30,),
          
            //text field
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('character name')
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.comment),
                  label: StyledText('character slogan')
                ),
              ),
          
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor)
              ),
              const Center(
                child: StyledHeading('Choose a vocation'),
              ),
              const Center(
                child: StyledText('This determines your available skill'),
              ),
              const SizedBox(height: 40),
          
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie),
                const SizedBox(height: 10,),
          
                VocationCard(
                  selected: selectedVocation == Vocation.ninja,
                  onTap: updateVocation,
                vocation: Vocation.ninja),

                const SizedBox(height: 10,),

                VocationCard(
                  selected: selectedVocation == Vocation.raider,
                  onTap: updateVocation, 
                vocation: Vocation.raider),
                
                const SizedBox(height: 10,), 

                 VocationCard(
                  selected: selectedVocation == Vocation.wizard,
                  onTap: updateVocation,
                vocation: Vocation.wizard),
              
              const SizedBox(height: 10,),

              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor)
              ),
              const Center(
                child: StyledHeading('Goodluck'),
              ),
              const Center(
                child: StyledText('Begin your journey'),
              ),
              const SizedBox(height: 40),
          
          
              Center(
                child: StyledButton(
                  onPressed: handleSumbit, 
                  child: const StyledHeading('create character')),
              )
          
            ],),
        ),
      )
    );
  }
}
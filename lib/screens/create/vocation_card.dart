import 'package:flutter/material.dart';
import 'package:students_portal/models/vocation.dart';
import 'package:students_portal/shared/styled_text.dart';
import 'package:students_portal/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.onTap,
    required this.selected,
  });


  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ?AppColors.secondaryColor: Colors.transparent,
        child: Padding(padding: const EdgeInsets.all(5),
        child: Row(children: [
          Image.asset("assets/img/vocation/${vocation.image}",
          width: 70,
          colorBlendMode: BlendMode.color,
          color: selected ? Colors.black.withOpacity(0.4): Colors.transparent,
          ),
          const SizedBox(width: 10,),
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 StyledHeading(vocation.title),
                 StyledText(vocation.description)
          ],))
        ],),)
      ),
    );
  }
}
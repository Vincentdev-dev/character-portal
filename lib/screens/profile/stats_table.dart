import 'package:flutter/material.dart';
import 'package:students_portal/models/character.dart';
import 'package:students_portal/shared/styled_text.dart';
import 'package:students_portal/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child:  Row(
              
              children: [
                Icon(Icons.star,
                color: widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                 const SizedBox(width: 20,),
                 const StyledText('stats points available'),
                 const Expanded(child: SizedBox(width: 8,), ),
                StyledHeading(widget.character.points.toString())
              ],
            ),
          ),

          //stats table
          Table(
            children: 
             widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.2)
                ),
                children: [

                  //stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: StyledHeading(stat['title']!),
                      ),
                      ),

                  //stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: StyledHeading(stat['value']!),
                      ),
                      ),

                  //stat icon upward
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_upward, color: AppColors.textColor,),
                      onPressed: () {
                        setState(() {
                           widget.character.increaseStat(stat['title']!);
                        });
                        
                      }, 
                      )
                      ),    

                  //stat icon downward
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(Icons.arrow_downward, color: AppColors.textColor,),
                      onPressed: () {
                        setState(() {
                           widget.character.decreaseStat(stat['title']!);
                        });
                        
                      }, 
                      )
                      ),        
                ]
              );
             }).toList()
             ),
            
          
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:students_portal/theme.dart';

class StyledButton extends StatelessWidget {
   const StyledButton({
    super.key,
    required this.onPressed,
    required this.child
  });

  final Function()onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.secondaryAccent, AppColors.titleColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            )

        ),
        child: child,
      ));
  }
}
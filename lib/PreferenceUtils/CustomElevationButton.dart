import 'package:flutter/material.dart';
class CustomElevationButton extends StatelessWidget {
  final Widget child;
  final double elevation;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  CustomElevationButton({
    required this.child,
    this.elevation = 2.0,
    this.onPressed,
    required this.backgroundColor, // Now requires a background color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed))
            return Colors.green; // Color when the button is pressed
          return Colors.red;    // Default color
        }),
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
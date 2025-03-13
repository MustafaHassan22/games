import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Button text
  final VoidCallback? onPressed; // Callback when pressed
  final bool isLoading; // Show loading indicator if true
  final Color backgroundColor; // Button background color
  final Color textColor; // Text color
  final double borderRadius; // Corner radius
  final EdgeInsets padding; // Internal padding

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor = Colors.blue, // Default color
    this.textColor = Colors.white, // Default text color
    this.borderRadius = 12.0, // Default radius
    this.padding = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // Disable when loading
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Button color
        foregroundColor: textColor, // Text/icon color
        padding: padding, // Custom padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
        ),
        elevation: 4.0, // Slight shadow for depth
        minimumSize:
            const Size(double.infinity, 50), // Full width, fixed height
      ),
      child: isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: textColor,
                strokeWidth: 2.5,
              ),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
    );
  }
}

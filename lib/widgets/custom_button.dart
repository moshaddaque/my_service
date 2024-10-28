import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTap;
  final double width;
  final double height;
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.color = const Color(0xFF284a79),
    this.textColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

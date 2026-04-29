import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool hasBoundedWidth = constraints.hasBoundedWidth;
        return SizedBox(
          width: hasBoundedWidth ? constraints.maxWidth : null,
          height: 48,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(title, style: const TextStyle(fontSize: 16)),
          ),
        );
      },
    );
  }
}

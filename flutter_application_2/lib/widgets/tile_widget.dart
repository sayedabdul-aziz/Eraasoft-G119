import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color(0xff265ed7)),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
      const SizedBox(width: 10),
      Text(text, style: const TextStyle(fontSize: 14))
    ]);
  }
}

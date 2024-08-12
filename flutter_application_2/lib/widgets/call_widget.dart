import 'package:flutter/material.dart';

class CallWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const CallWidget({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
            color: Color(0xffe4f2fd),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [const Icon(Icons.call), Text(text)],
        ),
      ),
    );
  }
}

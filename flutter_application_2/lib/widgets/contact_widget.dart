import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/tile_widget.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffe4f2fd),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        children: [
          TileWidget(
            icon: Icons.email_rounded,
            text: 'ahmed@gmail.com',
          ),
          SizedBox(height: 10),
          TileWidget(
            icon: Icons.call,
            text: '010101010101',
          ),
          SizedBox(height: 10),
          TileWidget(
            icon: Icons.call,
            text: '010101010101',
          ),
        ],
      ),
    );
  }
}

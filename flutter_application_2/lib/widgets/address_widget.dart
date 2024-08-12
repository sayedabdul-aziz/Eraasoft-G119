import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/tile_widget.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
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
            icon: Icons.local_hospital_rounded,
            text: 'Cairo Hospital',
          ),
          SizedBox(height: 10),
          TileWidget(
            icon: Icons.watch_later_outlined,
            text: '10:00 AM - 11:00 PM',
          ),
          SizedBox(height: 10),
          TileWidget(
            icon: Icons.location_on_rounded,
            text: 'Near the library, 8th floor, Cairo',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/call_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
        const CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://thumbs.dreamstime.com/z/serious-man-doctor-portrait-older-hospital-41602117.jpg'),
        ),
        const SizedBox(width: 20),
        // header data
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dr. Ahmed Ali',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff265ed7),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Dentist Specialist',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              const Row(children: [
                Icon(Icons.star_rounded, color: Colors.amber),
                SizedBox(width: 3),
                Text(
                  '5',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                CallWidget(
                  text: '1',
                  onTap: () {},
                ),
                const SizedBox(width: 15),
                CallWidget(
                  text: '2',
                  onTap: () {},
                )
              ])
            ],
          ),
        )
      ],
    );
  }
}

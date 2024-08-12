import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/address_widget.dart';
import 'package:flutter_application_2/widgets/contact_widget.dart';
import 'package:flutter_application_2/widgets/custom_button.dart';
import 'package:flutter_application_2/widgets/profile_header.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff265ed7),
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        title: const Text(
          'Doctor Profile',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              const ProfileHeader(),
              // about
              const SizedBox(
                height: 15,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nisl sit amet ultricies'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const AddressWidget(),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Info',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  ContactWidget()
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                text: 'Chat with Dr. Ahmed',
                bgColor: Colors.green,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Book Appointment',
                bgColor: const Color(0xff265ed7),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

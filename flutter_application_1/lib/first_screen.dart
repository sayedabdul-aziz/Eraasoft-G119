import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'My App',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Icon(
            Icons.notifications_active,
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/sayed.jpeg',
            //   width: 200,
            //   height: 200,
            //   fit: BoxFit.cover,
            // ),
            // CircleAvatar(
            //   radius: 100,
            //   backgroundImage: AssetImage('assets/sayed.jpeg'),
            // ),
            SizedBox(
              width: 300,
              height: 300,
              child: ClipOval(
                child: Image.network(
                  'https://media.licdn.com/dms/image/D4D03AQFDhvxrg5StnA/profile-displayphoto-shrink_200_200/0/1695348911344?e=1727308800&v=beta&t=BDqSU52Hg0sIPhT8nBxkMvULUHbF-i3tNcWyRNVFXSE',
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: 100,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Sayed Abdul-Aziz',
              style: TextStyle(fontSize: 30, color: Colors.deepOrange),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.facebook_rounded,
            //           color: Colors.blue,
            //         )),
            //     IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.telegram_rounded,
            //           color: Colors.blueGrey,
            //         )),
            //     IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.snapchat,
            //           color: Colors.yellow,
            //         )),
            //     IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.email_rounded,
            //           color: Colors.white38,
            //         ))
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

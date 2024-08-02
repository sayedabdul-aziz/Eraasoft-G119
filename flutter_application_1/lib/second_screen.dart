import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                      color: Colors.black38,
                    ),
                  ]),
              child: const Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/sayed.jpeg'),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Sayed Abdul-Aziz Sayed Abdul-AzizSayed Abdul-AzizSayed Abdul-AzizSayed Abdul-Aziz',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        '12:00 PM',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sayed Abdul-Aziz Sayed Abdul-AzizSayed Abdul-AzizSayed Abdul-AzizSayed Abdul-Aziz',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

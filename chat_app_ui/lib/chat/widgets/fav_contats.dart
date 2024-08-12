import 'package:chat_app_ui/chat/data/chat_model.dart';
import 'package:flutter/material.dart';

class FavoriteContactsWidget extends StatelessWidget {
  const FavoriteContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Favorite Contacts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        // IMAGE

                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(chatList[index].image ?? ''),
                        ),

                        // INDICATOR
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.indigo,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ),
                        // const Positioned(
                        //   top: 0,
                        //   left: 0,
                        //   child: CircleAvatar(
                        //     radius: 7,
                        //     backgroundColor: Colors.indigo,
                        //     child: CircleAvatar(
                        //       radius: 3,
                        //       backgroundColor: Colors.green,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      chatList[index].name?.split(' ').first ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                );
              },
              itemCount: chatList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/core/widgets/doctor_card.dart';
import 'package:se7ety/feature/auth/data/doctor_model.dart';

// collection?
// 1) doc id?

// 2) order by ?  "الترتيب"
// 3) where ?  "المقارنه"
// 4) startAt w endAt?  "البحث"

class TopRatedList extends StatefulWidget {
  const TopRatedList({super.key});

  @override
  _TopRatedListState createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('doctors')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                value: .9,
                color: Colors.black12,
              ),
            );
          } else {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DoctorModel doctor = DoctorModel.fromJson(
                  snapshot.data!.docs[index].data() as Map<String, dynamic>,
                );
                if (doctor.specialization == '') {
                  return const SizedBox();
                }
                return DoctorCard(
                  doctor: doctor,
                );
              },
            );
          }
        },
      ),
    );
  }
}

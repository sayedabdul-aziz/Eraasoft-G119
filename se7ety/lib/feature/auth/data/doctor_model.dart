// ignore_for_file: public_member_api_docs, sort_constructors_first

class DoctorModel {
  String? uid;
  String? name;
  String? email;
  String? phone1;
  String? phone2;
  String? address;
  String? specialization;
  String? openHour;
  String? closeHour;
  String? bio;
  String? image;
  int? rating;
  DoctorModel({
    this.uid,
    this.name,
    this.email,
    this.phone1,
    this.phone2,
    this.address,
    this.specialization,
    this.openHour,
    this.closeHour,
    this.bio,
    this.image,
    this.rating,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    address = json['address'];
    specialization = json['specialization'];
    openHour = json['openHour'];
    closeHour = json['closeHour'];
    bio = json['bio'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (email != null) data['email'] = email;
    if (rating != null) data['rating'] = rating;
    if (phone1 != null) data['phone1'] = phone1;
    if (phone2 != null) data['phone2'] = phone2;
    if (address != null) data['address'] = address;
    if (specialization != null) data['specialization'] = specialization;
    if (openHour != null) data['openHour'] = openHour;
    if (closeHour != null) data['closeHour'] = closeHour;
    if (bio != null) data['bio'] = bio;
    if (image != null) data['image'] = image;
    return data;
  }
}

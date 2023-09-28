// ignore_for_file: public_member_api_docs, sort_constructors_first
class DonarModel {
  String name;
  String bloodgroup;
  String address;
  String email;
  String age;
  String gender;
  String phonenumber;
  DonarModel({
    required this.name,
    required this.bloodgroup,
    required this.address,
    required this.email,
    required this.age,
    required this.gender,
    required this.phonenumber,
  });
  tojson() {
    return {
      "FullName": name,
      "Age": address,
      "BloodGroup": name,
      "Address": address,
      "Email": email,
      "Gender": gender,
      "PhoneNumber": phonenumber,
    };
  }
}

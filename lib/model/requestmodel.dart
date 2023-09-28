// ignore_for_file: public_member_api_docs, sort_constructors_first
class RequestBloodModel {
  String location;
  String date;
  String time;
  String name;
  String phonenumber;
  String bloodgroup;
  String gender;
  String relation;
  RequestBloodModel({
    required this.location,
    required this.date,
    required this.time,
    required this.name,
    required this.phonenumber,
    required this.bloodgroup,
    required this.gender,
    required this.relation,
  });
  tojson() {
    return {
      "PatientName": name,
      "Location": location,
      "Date": name,
      "Time": time,
      "Gender": gender,
      "PhoneNumber": phonenumber,
      "Blood Group": bloodgroup
    };
  }
}

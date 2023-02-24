import 'package:medi_rem/models/medicine.dart';

class UserData {
  String uid;
  String email;
  List<Medicine>? medicineList;
  UserData({required this.uid, required this.email,this.medicineList});
}

import 'package:equatable/equatable.dart';
import 'package:medi_rem/models/medicine.dart';

class UserData extends Equatable
{
  final String uid;
  final String email;
  final List<Medicine>? medicineList;
  const UserData({required this.uid,required this.email,this.medicineList});

  static const empty =UserData(uid:'',email: '',medicineList: []);

  bool get isEmpty=> this==UserData.empty;
  bool get isNotEmpty=> this!=UserData.empty;
  
  @override
  List<Object?> get props => [uid, email,medicineList];
}

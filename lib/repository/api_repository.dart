

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:medi_rem/models/apiMedicine.dart';
import 'package:medi_rem/repository/headers.dart';
class ApiRepository
{
  Future<List<ApiMedicines>> getMedicineList() async
  {
    List<ApiMedicines>? tempList;
    try 
    {
      var response=await http.get
      (
        Uri.https
        (
          ApiUrlRepository.requestHeaders['X-RapidAPI-Host']!,
          ApiUrlRepository.apiFeatures['medicineSearch']!,
        ),
        headers: ApiUrlRepository.requestHeaders
      );  

      var jsonData=jsonDecode(response.body);
      jsonData['data'].forEach
      (
        (v)
        {
          var res=ApiMedicines.fromJson(v);
          tempList!.add(res);
        }
      );

    } catch (e) 
    {
      log(e.toString());
      throw Exception(e);
    }
    return tempList==null ?[]:tempList; 
  }
}
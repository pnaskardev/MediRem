

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:medi_rem/models/apiMedicine.dart';
class ApiRepository
{
  Future<List<ApiMedicines>> getMedicineList(String query) async
  {
    log('insede getMedicineList');
    log(query);
    final queryParameters = 
    {
      'searchterm': query,
    };
    List<ApiMedicines> tempList=[];
    try 
    {
      var response=await http.get
      (
        Uri.parse
        (
          // ApiUrlRepository.requestHeaders['X-RapidAPI-Host']!,
          // ApiUrlRepository.apiFeatures['medicineSearch']!,
          'https://medicine-autocomplete-indian-brands.p.rapidapi.com/api/medicine/search',
        ).replace(queryParameters: queryParameters),
        headers: 
        {
          'X-RapidAPI-Key': '0d2760cfdbmshdaa5dd1cf2ef40ap1d5fcejsn528c11ac4adb',
          'X-RapidAPI-Host': 'medicine-autocomplete-indian-brands.p.rapidapi.com'
        },
        
      );  

      var jsonData=jsonDecode(response.body);
      // jsonData["data"].forEach
      // (
      //   (v)
      //   {
      //     var res=ApiMedicines.fromJson(v);
      //     tempList!.add(res);
      //   }
      // );
      jsonData["data"]["medicines"].forEach
      (
        (v)
        {
          var res=ApiMedicines.fromJson(v);
          tempList.add(res);
        }
      );

    } catch (e) 
    {
      log(e.toString());
      throw Exception(e);
    }
    return tempList; 
  }
}
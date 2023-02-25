import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_rem/logic/medicine_api_bloc/medicine_api_bloc.dart';

class SearchScreen extends StatefulWidget 
{
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> 
{
  @override
  Widget build(BuildContext context) 
  {
    return BlocProvider
    (
      create: (context)=>MedicineApiBloc
      (

      )..add(LoadMedicineListEvent()),
      child: SafeArea
      (
        child: Scaffold
        (
          // body: Center(child: Text('Search Page'),)
          body: BlocBuilder<MedicineApiBloc,MedicineApiState>
          (
            builder: (context,state)
            {
              if(state is MedicineApiLoadingState)
              {
                return const Center
                (
                  child: CircularProgressIndicator(),
                );
              }
              else if(state is MedicineApiLoadedState)
              {
                return const Center(child: Text(' Medicine loaded state'),);
              }
              return const Center(child: Text('Search Page'),);
            }
          ),
        ),
      ), 
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medi_rem/logic/medicine_api_bloc/medicine_api_bloc.dart';
import 'package:medi_rem/repository/api_repository.dart';

class SearchScreen extends StatefulHookWidget
{
  const SearchScreen({Key? key}) : super(key: key);


  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
{
  final _bookFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) 
  {
    final titleTextController = useTextEditingController();
    final text=useState('');
    useEffect
    (() 
      {
        titleTextController.addListener
        (() 
          {
            text.value=titleTextController.text;
          }
        );
        return null;
      },
      [titleTextController]
    );
    // return BlocProvider<MedicineApiBloc>
    // (
    //   create: (context)=>MedicineApiBloc
    //   (
    //     apiRepository: RepositoryProvider.of<ApiRepository>(context),
    //   ),
    //   /*..add(LoadMedicineListEvent()),*/
    //   child: SafeArea
    //   (
    //     child: Scaffold
    //     (
    //       body: Column
    //       (
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: 
    //         [
    //           const SizedBox
    //           (
    //             height: 100,
    //           ),
    //           Form
    //           (
    //             key: _bookFormKey,
    //             autovalidateMode: AutovalidateMode.onUserInteraction,
    //             child: Row
    //             (
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: 
    //               [
    //                 Flexible
    //                 (
    //                   child: TextFormField
    //                   (
    //                     controller: titleTextController,
    //                     decoration: const InputDecoration
    //                     (
    //                       labelText: "Search any Medicine",
    //                       focusedBorder: OutlineInputBorder
    //                       (
    //                         borderRadius: BorderRadius.all(Radius.circular(15)),
    //                         borderSide: BorderSide(width: 2),
    //                       ),
    //                       border: OutlineInputBorder
    //                       (
    //                         borderRadius: BorderRadius.all(Radius.circular(15)),
    //                         borderSide: BorderSide
    //                         (
    //                           width: 2,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Flexible
    //                 (
    //                   child: ElevatedButton.icon
    //                   (
    //                     onPressed:()
    //                     {
    //                       BlocProvider.of<MedicineApiBloc>(context).add(LoadMedicineListEvent(query: titleTextController.text));
    //                     } , 
    //                     icon: const Icon(Icons.search), 
    //                     label: const Text('Search')
    //                   )
    //                 )
    //               ],
    //             )
    //           ),
    //           SizedBox
    //           (
    //             height: 200,
    //             child: Padding
    //             (
    //               padding: const EdgeInsets.all(16.0),
    //               child: Card
    //               (
    //                 child: Center
    //                 (
    //                   child: BlocBuilder<MedicineApiBloc,MedicineApiState>
    //                   (
    //                     builder: (context,state)
    //                     {
    //                       if(state is MedicineApiErrorState)
    //                       {
    //                         return const Center
    //                         (
    //                           child: CircularProgressIndicator(),
    //                         );
    //                       }
    //                       else if(state is MedicineApiLoadedState)
    //                       {
    //                         // Create a list builder
    //                         return const Center(child: Text(' Medicine loaded state'),);
    //                       }
    //                       return const Center(child: Text('Search Page'),);
    //                     }
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ), 
    // );
    return SafeArea
      (
        child: Scaffold
        (
          body: Column
          (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              const SizedBox
              (
                height: 100,
              ),
              Form
              (
                key: _bookFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: 
                  [
                    Flexible
                    (
                      child: TextFormField
                      (
                        controller: titleTextController,
                        decoration: const InputDecoration
                        (
                          labelText: "Search any Medicine",
                          focusedBorder: OutlineInputBorder
                          (
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(width: 2),
                          ),
                          border: OutlineInputBorder
                          (
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide
                            (
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible
                    (
                      child: ElevatedButton.icon
                      (
                        onPressed:()
                        {
                          BlocProvider.of<MedicineApiBloc>(context).add(LoadMedicineListEvent(query: text.value));
                        } , 
                        icon: const Icon(Icons.search), 
                        label: const Text('Search')
                      )
                    )
                  ],
                )
              ),
              Expanded
              (
                child: SizedBox
                (
                  child: Padding
                  (
                    padding: const EdgeInsets.all(16.0),
                    child: Card
                    (
                      child: Center
                      (
                        child: BlocBuilder<MedicineApiBloc,MedicineApiState>
                        (
                          builder: (context,state)
                          {
                            if(state is MedicineApiErrorState)
                            {
                              return const Center
                              (
                                child: Icon(Icons.error),
                              );
                            }
                            else if(state is MedicineApiLoadingState)
                            {
                              return const Center
                              (
                                child: CircularProgressIndicator(),
                              );
                            }
                            else if(state is MedicineApiLoadedState)
                            {
                              // Create a list builder
                              // return const Center(child: Text(' Medicine loaded state'),);
                              return Center
                              (
                                child: ListView.builder
                                (
                                  shrinkWrap: true,
                                  itemCount: state.medicineList.length,
                                  itemBuilder: ((context, index) 
                                  {
                                    return Card
                                    (
                                      elevation: 5,
                                      child: ListTile
                                      (
                                        // leading:Text(state.medicineList[index].companyName!),
                                        title: Text(state.medicineList[index].name!),
                                        subtitle: Text(state.medicineList[index].content!),
                                        trailing: Text(state.medicineList[index].price!.toString()),
                                      ),
                                    );
                                  }) 
                                ),
                              );
                            }
                            return const Center(child: Text('Search Page'),);
                          }
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
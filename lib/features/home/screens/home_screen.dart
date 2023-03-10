import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_rem/features/add_medicine/add_medicine.dart';
import 'package:medi_rem/features/home/widgets/medicine_card.dart';
import 'package:medi_rem/logic/medicine_cubit/medicine_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    // final user=BlocProvider.of<AppBloc>(context).getUser;
    return BlocBuilder<MedicineCubit,MedicineState>
    (
      builder: (context, state)
      {
        return SafeArea
        (
          child: Scaffold
          (
            body: Center
            (
              // child: user==null ? const Text('User is null'): Text(user!.email)
              child: state.list.isEmpty? const Center(child: Text('You have not added any Medicine Reminders'),) : ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) 
                {
                  // return ListTile(title: Text(state.list[index].name));
                  return MedicineCard(med: state.list[index]);
                },
              )
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton.extended
            (
              onPressed: ()
              {
                Navigator.of(context).push
                (
                   MaterialPageRoute
                  (
                    builder: (context) =>  const AddMedicine(),
                  )
                );
              },
              icon: const Icon(Icons.add), 
              label: const Text('Add Medication')
            ),
          ),
        );
      },
      
    );
  }
}

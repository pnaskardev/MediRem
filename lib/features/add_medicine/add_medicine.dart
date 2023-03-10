// ignore_for_file: use_build_context_synchronously

import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medi_rem/common/navbar/page/success_page.dart';
import 'package:medi_rem/logic/medicine_cubit/medicine_cubit.dart';
import 'package:medi_rem/models/medicine.dart';
import 'package:medi_rem/utils/string_validator.dart';

class AddMedicine extends StatefulWidget 
{
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> 
{
  final _formKey = GlobalKey<FormState>();  
  final TextEditingController _medicationName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _freq = TextEditingController();
  final TextEditingController _duration = TextEditingController();
  List<DateTime> selectedTime=[];
  @override
  void dispose() 
  {
    super.dispose();
    _medicationName.dispose();
    _description.dispose();
    _freq.dispose();
    _duration.dispose();
  }

  @override
  Widget build(BuildContext context)
   {
    return  SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form
              (
                key: _formKey,
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: "Medication Name",
                    errorMaxLines: 3,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  controller: _medicationName,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 3,
                  decoration: const InputDecoration
                  (
                    labelText: "Description",
                    errorMaxLines: 3,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  controller: _description,
                ),
                const SizedBox(height: 10,),
                    TextFormField(
                      // readOnly: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: "Reminder Frequency",
                        errorMaxLines: 3,
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _freq,
                    ),
                    const SizedBox(height: 10,),
                    Column
                    (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: 
                      [
                        Flexible
                        (
                          child: selectedTime.isNotEmpty ? Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder
                              (
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                                (
                                  crossAxisCount: 3,
                                ),
                                itemCount: selectedTime.length,
                                itemBuilder: (BuildContext context,int index)
                                {
                                  return Chip
                                  (
                                    label:Text(selectedTime[index].toString()),
                                    deleteIcon: const Icon(Icons.delete), 
                                    onDeleted: ()
                                    {
                                      setState(() 
                                      {
                                        selectedTime.removeAt(index);  
                                      });
                                    },
                                  );
                                }
                              ),
                            ),
                          )
                          :
                          const Padding(
                            padding:  EdgeInsets.all(16.0),
                            child:  Card(child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('No time has been added'),
                            )),
                          )
                        ),
                        Flexible
                        (
                          child: Center
                          (
                            child: ElevatedButton.icon
                            (
                              onPressed: () async
                              {
                                TimeOfDay? pickedTime=await showTimePicker
                                (
                                  context: context, 
                                  initialTime: TimeOfDay.now()
                                );
                                dev.log(pickedTime!.format(context));
                                DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                dev.log(parsedTime.toString());
                                String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                dev.log(formattedTime);
                                setState(() 
                                {
                                  selectedTime.add(parsedTime); //set the value of text field. 
                                });
                              }, 
                              icon: const Icon(Icons.add), 
                              label: const Text('Add Time')
                            )
                          ),
                        )
                      ],
                      
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: "Reminder Duravtion",
                        errorMaxLines: 3,
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (!StringValidator.validatePhone(value!)) {
                          return 'Invalid number';
                        } else if (value.isEmpty) {
                          return "Please enter a valid number";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _duration,
                    ),
                    ],
                )
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended
        (
          onPressed: () async
          {
            Medicine item=Medicine
            (
              id: (Random().nextInt(1000)+1).toString(),
              name: _medicationName.text,
              description: _description.text,
              freq: int.parse(_freq.text),
              timeList: selectedTime,
              days: int.parse(_duration.text)
            );
            BlocProvider.of<MedicineCubit>(context).addItem(item);
            Navigator.of(context).pushReplacement
            (
              MaterialPageRoute
              (
                builder: (context) =>  const SuccessPage(),
              )
            );
          }, 
          label: const Text('Add Medicine')
        ),
      ),
    );
  }
}

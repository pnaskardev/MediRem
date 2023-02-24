// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medi_rem/utils/string_validator.dart';

class AddMedicine extends StatefulWidget 
{
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> 
{
  final TextEditingController _medicationName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _freq = TextEditingController();
  final TextEditingController _duration = TextEditingController();
  List time=['10:00','11:00','15:00'];
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
              child: Form(
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
                      readOnly: true,
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
                          child: time.isNotEmpty ? Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder
                              (
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                                (
                                  crossAxisCount: 3,
                                ),
                                itemCount: time.length,
                                itemBuilder: (BuildContext context,int index)
                                {
                                  return Chip
                                  (
                                    label:Text(time[index]),
                                    deleteIcon: const Icon(Icons.delete), 
                                    onDeleted: ()
                                    {
                                      setState(() 
                                      {
                                        time.removeAt(index);  
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
                                log(pickedTime!.format(context));
                                DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                log(parsedTime.toString());
                                String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                log(formattedTime);
                                setState(() 
                                {
                                  time.add(formattedTime); //set the value of text field. 
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
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

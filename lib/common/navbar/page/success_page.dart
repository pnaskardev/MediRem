import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_rem/common/navbar/bloc/cubit/navigation_cubit.dart';

class SuccessPage extends StatelessWidget 
{
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Column
      (
        children: 
        [
          _bidSuccess(context),
          contButton(context),
        ],
      ),
    );
  }
}


Widget _bidSuccess(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.8,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            const Center
            (
              child: Text
              (
                'Your Reminder has been successfully added',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Lottie.network(
                  "https://assets9.lottiefiles.com/packages/lf20_pqnfmone.json"),
            ),
          ]
          ),
    ),
  );
}

Widget contButton(BuildContext context) 
{
  return TextButton
  (
      onPressed: () 
      {
        BlocProvider.of<NavigationCubit>(context).changePage(0);
        Navigator.of(context).pop();
      },
      child: Container(
        height: 30,
        width: 300,
        decoration: const BoxDecoration(
            // color: ,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Center(
          child: Text(
            "Continue to Home Page",
            style: TextStyle(color: Colors.purpleAccent),
          ),
        ),
      ));
}
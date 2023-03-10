import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_rem/common/navbar/bloc/cubit/navigation_cubit.dart';
import 'package:medi_rem/features/add_medicine/add_medicine.dart';
import 'package:medi_rem/features/home/screens/home_screen.dart';
import 'package:medi_rem/features/search/search_screen.dart';
import 'package:medi_rem/features/settings/screens/settings_page.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MediRem'),
      ),
      body: PageView(
        controller: controller,
        children: const [
          HomePage(),
          // AddMedicine(),
          SearchScreen(),
          SettingsPage()
        ],
        onPageChanged: (index) {
          log('Page changed index->>$index');
          currentPageIndex = index;
          BlocProvider.of<NavigationCubit>(context).changePage(index);
        },
      ),
      bottomNavigationBar: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (context, state) 
        {
          currentPageIndex = state.index;
          controller.animateToPage
          (
            state.index,duration: const Duration(milliseconds: 250),
            curve: Curves.easeIn
          );
          log(currentPageIndex.toString());
        },
        builder: (context, state) {
          return NavigationBar(
              selectedIndex: currentPageIndex,
              onDestinationSelected: (int index) {
                log('Destination selected index->>$index');
                controller.animateToPage(index,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn);
                BlocProvider.of<NavigationCubit>(context).changePage(index);
              },
              destinations: const <Widget>[
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                // NavigationDestination(
                //   icon: Icon(Icons.add_alarm),
                //   label: 'Add Medication',
                // ),
                NavigationDestination(
                  icon: Icon(Icons.search_rounded),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ]);
        },
      ),
    ));
  }
}

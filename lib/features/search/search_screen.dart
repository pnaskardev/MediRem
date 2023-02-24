import 'package:flutter/material.dart';
import 'package:medi_rem/utils/string_validator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold
      (
        body: Center(child: Text('Search Page'),) 
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/screens/quote/bloc/quote_bloc.dart';
import 'package:quote/screens/quote/quote_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteBloc(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey),
        debugShowCheckedModeBanner: false,
        home:  QuoteScreen(),
      ),
    );
  }
}

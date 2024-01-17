import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/screens/quote/bloc/quote_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (){
        BlocProvider.of<QuoteBloc>(context).add(QuoteRequestEvent());
      },

      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(35),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
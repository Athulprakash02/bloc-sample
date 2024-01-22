import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote/screens/quote/bloc/quote_bloc.dart';
import 'package:quote/screens/quote/widgets/custom_button.dart';
import 'package:quote/screens/quote/widgets/quote_widget.dart';

// ignore: must_be_immutable
class QuoteScreen extends StatelessWidget {
  QuoteScreen({super.key});
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Home'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(child: Center(
                child: BlocBuilder<QuoteBloc, QuoteState>(
                  builder: (context, state) {
                    if (state is QuoteInitial) {
                      return const Text('Your quote is waiting');
                    } else if (state is QuoteLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is QuoteLoadedState) {
                      return QuoteWidget(text: state.quote);
                    } else {
                      return const Text('something went wrong');
                    }
                  },
                ),
              )),
              const CustomButton(text: 'Generate'),
              IconButton(onPressed: () {
                BlocProvider.of<QuoteBloc>(context)
                    .add(FavouriteQuoteEvent(isFavoured: isFav));
              }, icon: BlocBuilder<QuoteBloc, QuoteState>(
                builder: (context, state) {
                  if (state is QuoteFavouritedState) {
                    isFav = state.isFav;
                    return state.isFav
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border);
                  } else {
                    return const Icon(Icons.favorite_border);
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

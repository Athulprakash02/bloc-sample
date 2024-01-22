part of 'quote_bloc.dart';

@immutable
sealed class QuoteState {}

final class QuoteInitial extends QuoteState {}

class QuoteLoadingState extends QuoteState{
 
}
class QuoteLoadedState extends QuoteState {
   final String quote;

  QuoteLoadedState({required this.quote});


}

class QuoteFavouritedState extends QuoteState {
  final bool isFav;

  QuoteFavouritedState({required this.isFav});
  
}


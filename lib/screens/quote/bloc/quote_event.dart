part of 'quote_bloc.dart';

@immutable
sealed class QuoteEvent {}

class QuoteRequestEvent extends QuoteEvent {
  
}

class FavouriteQuoteEvent extends QuoteEvent {
  final bool isFavoured;

  FavouriteQuoteEvent({required this.isFavoured});
  
}
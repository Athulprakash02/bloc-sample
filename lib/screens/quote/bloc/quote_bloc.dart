import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    on<FavouriteQuoteEvent>((event, emit) {
      bool isFav = event.isFavoured;

      emit(QuoteFavouritedState(isFav: !isFav));
    });
    on<QuoteRequestEvent>((event, emit) async {
      emit(QuoteLoadingState());

      await Future.delayed(const Duration(seconds: 3), () {
        emit(QuoteLoadedState(quote: 'Your quote is loaded'));
      });
    });
  }
}

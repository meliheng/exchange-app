import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pgproject/exchange/model/exchange_model.dart';

part 'exchange_event.dart';
part 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(ExchangeFetchListState()) {
    on<ExchangeInitialEvent>(initialEvent);
    on<ExchangeSourceCurrencySelectionEvent>(selectionSourceCurrencyEvent);
    on<ExchangeConvertedCurrencySelectionEvent>(
        selectionConvertedCurrencyEvent);
    on<ExchangeChangeCurrencyValueInputEvent>(changeCurrencyValueInputEvent);
    on<ExchangeFetchListEvent>(exchangeFetchListEvent);
    on<ExchangeBackButtonClickEvent>(exchangeBackButtonClickEvent);
  }

  List<Exchange> currencyList = <Exchange>[];

  // INITIAL EVENT
  FutureOr<void> initialEvent(
      ExchangeInitialEvent event, Emitter<ExchangeState> emit) {}

  // BACK BUTTON EVENT
  FutureOr<void> exchangeBackButtonClickEvent(
      ExchangeBackButtonClickEvent event, Emitter<ExchangeState> emit) {}

  // SOURCE CURRENCY SELECT EVENT
  FutureOr<void> selectionSourceCurrencyEvent(
      ExchangeSourceCurrencySelectionEvent event, Emitter<ExchangeState> emit) {
    // currency list bloc içinde variable olarak tanımlanacak, eventten alınmayacan, fetch edilince doldurulacak, gerektiğinde ordan doldurlucak.
    emit(
      ExchangeInitialState(
        amount: event.amount,
        selectedSourceCurrency: event.exchange,
        selectedConvertedCurrency: event.selectedConvertedCurrency,
        result: calculateResult(
          toCurrency: event.selectedConvertedCurrency.toCur!,
          fromCurrency: event.exchange.fromCur!,
          amount: event.amount,
        ),
      ),
    );
  }

  // CONVERTED CURRENCY SELECT EVENT
  FutureOr<void> selectionConvertedCurrencyEvent(
      ExchangeConvertedCurrencySelectionEvent event,
      Emitter<ExchangeState> emit) {
    emit(
      ExchangeInitialState(
        amount: event.amount,
        selectedSourceCurrency: event.selectedSourceCurrency,
        selectedConvertedCurrency: event.exchange,
        result: calculateResult(
          toCurrency: event.exchange.toCur!,
          fromCurrency: event.selectedSourceCurrency.fromCur!,
          amount: event.amount,
        ),
      ),
    );
  }

  // CHANGE CURRENCY VALUE INPUT EVENT
  FutureOr<void> changeCurrencyValueInputEvent(
      ExchangeChangeCurrencyValueInputEvent event,
      Emitter<ExchangeState> emit) {
    emit(
      ExchangeInitialState(
        amount: event.amount,
        selectedSourceCurrency: event.selectedSourceCurrency,
        selectedConvertedCurrency: event.selectedConvertedCurrency,
        result: calculateResult(
          toCurrency: event.selectedConvertedCurrency.toCur!,
          fromCurrency: event.selectedSourceCurrency.fromCur!,
          amount: event.amount,
        ),
      ),
    );
  }

  // FETCH CURRRENCY LIST EVENT
  FutureOr<void> exchangeFetchListEvent(
      ExchangeFetchListEvent event, Emitter<ExchangeState> emit) async {
    currencyList = await fetchCurrencyList();
    emit(
      ExchangeInitialState(
        amount: 0,
        selectedSourceCurrency: Exchange.exchangeList[0],
        selectedConvertedCurrency: Exchange.exchangeList[0],
        result: 0,
      ),
    );
  }

  // FETCH CURRENCY LIST FUNCTION
  Future<List<Exchange>> fetchCurrencyList() async {
    await makeDelay();
    return Exchange.exchangeList.filter();
  }

  // MAKE SOME DELAY FUNCTION
  Future<void> makeDelay() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  // FINDING EXCHANGE RATE FROM CURRENCY LIST FUNCTION FOR THE CALCULATE TOTAL
  double findExchangeRate({
    required String toCurrency,
    required String fromCurrency,
    required List<Exchange> currencyList,
  }) {
    double exchangeRate = currencyList
            .firstWhere(
              (element) =>
                  element.toCur == toCurrency &&
                  element.fromCur == fromCurrency,
              orElse: () => Exchange(),
            )
            .excRate ??
        0;

    return exchangeRate;
  }

  // CALCULATE TOTAL FUNCTION
  double calculateResult({
    required String toCurrency,
    required String fromCurrency,
    required double amount,
  }) {
    return amount *
        findExchangeRate(
          toCurrency: toCurrency,
          fromCurrency: fromCurrency,
          currencyList: currencyList,
        );
  }
}

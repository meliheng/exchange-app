part of 'exchange_bloc.dart';

@immutable
sealed class ExchangeState {}

@immutable
sealed class ExchangeActionState extends ExchangeState {}

// INITIAL EVENT
final class ExchangeInitialState extends ExchangeState {
  final double amount;
  final Exchange selectedSourceCurrency;
  final Exchange selectedConvertedCurrency;
  final double result;

  ExchangeInitialState({
    required this.amount,
    required this.selectedSourceCurrency,
    required this.selectedConvertedCurrency,
    required this.result,
  });
}

// SOURCE CURRENCY SELECT STATE
@immutable
final class ExchangeSelectionSourceCurrencyState extends ExchangeState {
  final Exchange exchange;
  final double amount;
  final Exchange selectedConvertedCurrency;
  ExchangeSelectionSourceCurrencyState({
    required this.exchange,
    required this.amount,
    required this.selectedConvertedCurrency,
  });
}

// CONVERTED CURRENCY SELECT STATE
@immutable
final class ExchangeSelectionConvertedCurrencyState extends ExchangeState {
  final Exchange exchange;
  final double amount;
  final Exchange selectedSourceCurrency;

  ExchangeSelectionConvertedCurrencyState({
    required this.exchange,
    required this.amount,
    required this.selectedSourceCurrency,
  });
}

// CHANGE CURRENCY VALUE INPUT STATE
final class ExchangeChangeCurrencyValueInputState extends ExchangeState {
  final Exchange selectedConvertedCurrency;
  final double amount;
  final Exchange selectedSourceCurrency;

  ExchangeChangeCurrencyValueInputState({
    required this.selectedConvertedCurrency,
    required this.amount,
    required this.selectedSourceCurrency,
  });
}

// FETCH CURRRENCY LIST STATE
final class ExchangeFetchListState extends ExchangeState {}

// BACK BUTTON ACTION STATE
final class ExchangeBackButtonClickActionState extends ExchangeActionState {}

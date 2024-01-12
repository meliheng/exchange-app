// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'exchange_bloc.dart';

@immutable
sealed class ExchangeEvent {}

// INITIAL EVENT
class ExchangeInitialEvent extends ExchangeEvent {}

// SOURCE CURRENCY SELECT EVENT
class ExchangeSourceCurrencySelectionEvent extends ExchangeEvent {
  final Exchange exchange;
  final double amount;
  final Exchange selectedConvertedCurrency;

  ExchangeSourceCurrencySelectionEvent({
    required this.exchange,
    required this.amount,
    required this.selectedConvertedCurrency,
  });
}

// CONVERTED CURRENCY SELECT EVENT
class ExchangeConvertedCurrencySelectionEvent extends ExchangeEvent {
  final Exchange exchange;
  final double amount;
  final Exchange selectedSourceCurrency;

  ExchangeConvertedCurrencySelectionEvent({
    required this.exchange,
    required this.amount,
    required this.selectedSourceCurrency,
  });
}

// CHANGE CURRENCY VALUE INPUT EVENT
class ExchangeChangeCurrencyValueInputEvent extends ExchangeEvent {
  final Exchange selectedConvertedCurrency;
  final double amount;
  final Exchange selectedSourceCurrency;

  ExchangeChangeCurrencyValueInputEvent({
    required this.selectedConvertedCurrency,
    required this.amount,
    required this.selectedSourceCurrency,
  });
}

// FETCH CURRRENCY LIST EVENT
class ExchangeFetchListEvent extends ExchangeEvent {}

// BACK BUTTON EVENT
class ExchangeBackButtonClickEvent extends ExchangeEvent {}

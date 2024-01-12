// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorState {}

@immutable
sealed class CalculatorActionState extends CalculatorState {}

class CalculatorResultState extends CalculatorState {
  final String result;
  final String previous;

  CalculatorResultState({
    required this.result,
    required this.previous,
  });
}

final class CalculatorBackButtonPressedActionState
    extends CalculatorActionState {}

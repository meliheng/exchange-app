part of 'calculator_bloc.dart';

@immutable
sealed class CalculatorEvent {}

class CalculatorNumberPressedEvent extends CalculatorEvent {
  final String number;

  CalculatorNumberPressedEvent(this.number);
}

class CalculatorOperationPressedEvent extends CalculatorEvent {
  final OperatorEnum operation;

  CalculatorOperationPressedEvent(this.operation);
}

class CalculatorEqualPressedEvent extends CalculatorEvent {}

class CalculatorClearPressedEvent extends CalculatorEvent {}

class CalculatorDeletePressedEvent extends CalculatorEvent {}

class CalculatorBackButtonPressedEvent extends CalculatorEvent {}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pgproject/calculator/constants/utility/operator_enum.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorResultState(previous: '', result: '')) {
    on<CalculatorNumberPressedEvent>(_numberPressed);
    on<CalculatorOperationPressedEvent>(_operationPressed);
    on<CalculatorEqualPressedEvent>(_equalPressed);
    on<CalculatorClearPressedEvent>(_clearPressed);
    on<CalculatorDeletePressedEvent>(_deletePressed);
    on<CalculatorBackButtonPressedEvent>(_backButtonPressed);
  }
  String _currentInput = '';
  OperatorEnum _currentOperation = OperatorEnum.none;
  String _result = '';
  String _previous = '';

  bool canAddedDot() {
    if (_currentInput.contains('.')) {
      return false;
    }
    return true;
  }

  FutureOr<void> _numberPressed(
    CalculatorNumberPressedEvent event,
    Emitter<CalculatorState> emit,
  ) {
    // Check if the current input length is within the limit

    if (_currentInput.length <= 9) {
      // Check if the pressed number is a dot and it can be added
      if (event.number == '.') {
        if (canAddedDot()) {
          if (_currentInput.isEmpty) {
            _currentInput += '0';
          }
          _currentInput += event.number; // Add the dot to the current input
        }
      } else {
        // If the pressed number is not a dot, add it to the current input
        _currentInput += event.number;
      }
      if (_currentOperation != OperatorEnum.none) {
        _previous += _currentOperation.toUIString;
      }
      // Emit the updated calculator state with the current input
      emit(CalculatorResultState(result: _currentInput, previous: _previous));
    }
  }

  FutureOr<void> _operationPressed(
    CalculatorOperationPressedEvent event,
    Emitter<CalculatorState> emit,
  ) {
    // Check if there is any current input
    if (_currentInput.isNotEmpty) {
      // Check if there is a previous operation
      if (_currentOperation != OperatorEnum.none) {
        _calculateResult(); // Calculate the result based on the previous operation
      }

      // Set the current operation to the pressed operation
      _currentOperation = event.operation;
      _result = _currentInput; // Save the current input as the result
      _previous = _currentInput;
      _currentInput = ''; // Reset the current input for the next number input
    }

    // Emit the updated calculator state with the result or '0' if result is empty
    emit(
      CalculatorResultState(
        result: _currentOperation.toUIString,
        previous: _result,
      ),
    );
  }

  void _calculateResult() {
    // Convert current input and result to double
    final double inputValue = double.parse(_currentInput);
    final double resultValue = double.parse(_result);

    // Perform calculation based on the current operation
    switch (_currentOperation) {
      case OperatorEnum.addition:
        _result = (resultValue + inputValue).toStringAsFixed(2);
        break;
      case OperatorEnum.subtraction:
        _result = (resultValue - inputValue).toStringAsFixed(2);
        break;
      case OperatorEnum.multiplication:
        _result = (resultValue * inputValue).toStringAsFixed(2);
        break;
      case OperatorEnum.division:
        // Check for division by zero
        if (inputValue == 0) {
          _result = "0";
          break;
        }
        _result = (resultValue / inputValue).toStringAsFixed(2);
        break;
      case OperatorEnum.none:
      case OperatorEnum.equal:
        // No calculation needed for these cases
        break;
    }
  }

  FutureOr<void> _equalPressed(
    CalculatorEqualPressedEvent event,
    Emitter<CalculatorState> emit,
  ) {
    // Check if there is any current input and there is a previous operation
    if (_currentInput.isNotEmpty && _currentOperation != OperatorEnum.none) {
      _calculateResult(); // Calculate the result based on the current operation
      _currentOperation = OperatorEnum.none; // Reset the current operation
      _currentInput = _result; // Update the current input with the result
    }

    // Emit the updated calculator state with the result or '0' if result is empty
    emit(CalculatorResultState(
        result: _result.isEmpty ? '0' : _result, previous: ''));
  }

  FutureOr<void> _clearPressed(
    CalculatorClearPressedEvent event,
    Emitter<CalculatorState> emit,
  ) {
    // Clear all calculator states: current input, current operation, and result
    _currentInput = '';
    _currentOperation = OperatorEnum.none;
    _result = '';

    // Emit the updated calculator state with an empty result
    emit(CalculatorResultState(result: '', previous: ''));
  }

  FutureOr<void> _deletePressed(
    CalculatorDeletePressedEvent event,
    Emitter<CalculatorState> emit,
  ) {
    // Check if there is any current input
    if (_currentInput.isNotEmpty) {
      // Remove the last character from the current input
      _currentInput = _currentInput.substring(0, _currentInput.length - 1);

      // Emit the updated calculator state with the modified current input
      emit(CalculatorResultState(result: _currentInput, previous: ''));
    }
  }

  FutureOr<void> _backButtonPressed(
      CalculatorBackButtonPressedEvent event, Emitter<CalculatorState> emit) {
    emit(CalculatorBackButtonPressedActionState());
  }
}

import 'package:flutter/material.dart';
import 'package:pgproject/core/extension/string_extension.dart';
import 'package:pgproject/exchange/bloc/exchange_bloc.dart';
import 'package:pgproject/exchange/utility/exchange_style_constants.dart';

class CurrencyValueInputArea extends StatelessWidget {
  final ExchangeInitialState state;
  final ExchangeBloc bloc;
  const CurrencyValueInputArea({
    super.key,
    required this.state,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ExchangeStyleConstants.containerWidth,
      height: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onChanged: (value) {
          bloc.add(
            ExchangeChangeCurrencyValueInputEvent(
              selectedConvertedCurrency: state.selectedConvertedCurrency,
              amount: value
                  .toAmount, // this method was defined in the string extension file.
              selectedSourceCurrency: state.selectedSourceCurrency,
            ),
          );
        },
      ),
    );
  }
}

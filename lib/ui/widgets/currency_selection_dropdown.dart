import 'package:flutter/material.dart';
import 'package:pgproject/bloc/exchange_bloc.dart';
import 'package:pgproject/model/exchange_model.dart';
import 'package:pgproject/ui/widgets/dropdown_widget.dart';
import 'package:pgproject/utility/exchange_style_constants.dart';

class CurrencySelectionDropdown extends StatelessWidget {
  final ExchangeBloc bloc;
  final ExchangeInitialState state;
  const CurrencySelectionDropdown({
    super.key,
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: ExchangeStyleConstants.containerWidth,
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownWidget(
            value: state.selectedSourceCurrency,
            currencyList: bloc.currencyList.filterByFromCur(),
            isFromCur: true,
            onChanged: (v) {
              bloc.add(
                ExchangeSourceCurrencySelectionEvent(
                  exchange: v!,
                  amount: state.amount,
                  selectedConvertedCurrency: state.selectedConvertedCurrency,
                ),
              );
            },
          ),
        ),
        const Icon(Icons.currency_exchange),
        Container(
          width: ExchangeStyleConstants.containerWidth,
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownWidget(
            value: state.selectedConvertedCurrency,
            currencyList: bloc.currencyList.filterByToCur(),
            isFromCur: false,
            onChanged: (v) {
              bloc.add(
                ExchangeConvertedCurrencySelectionEvent(
                  exchange: v!,
                  amount: state.amount,
                  selectedSourceCurrency: state.selectedSourceCurrency,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

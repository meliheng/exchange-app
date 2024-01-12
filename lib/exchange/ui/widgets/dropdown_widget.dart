import 'package:flutter/material.dart';
import 'package:pgproject/exchange/model/exchange_model.dart';

class DropdownWidget extends StatelessWidget {
  final Exchange value;
  final void Function(Exchange?)? onChanged;
  final List<Exchange> currencyList;
  final bool isFromCur;
  const DropdownWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.currencyList,
    required this.isFromCur,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Exchange>(
      isExpanded: true,
      padding: const EdgeInsets.only(left: 5),
      value: value,
      underline: const SizedBox(),
      items: currencyList
          .map(
            (e) => DropdownMenuItem<Exchange>(
              value: e,
              child: Text(isFromCur ? e.fromCur! : e.toCur!),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}

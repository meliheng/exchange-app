import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgproject/calculator/bloc/calculator_bloc.dart';
import 'package:pgproject/calculator/constants/theme/colors.dart';
import 'package:pgproject/calculator/constants/utility/number_enum.dart';
import 'package:pgproject/calculator/constants/utility/operator_enum.dart';
import 'package:pgproject/calculator/constants/utility/text_styles.dart';
import 'package:pgproject/calculator/ui/widget/calculator_button.dart';
import 'package:pgproject/calculator/ui/widget/result_area.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final String _appbarTitle = "HESAP MAKİNESİ";
  final String _sil = "SİL";
  final String _temizle = "C";
  final CalculatorBloc _bloc = CalculatorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appbarTitle,
          style: ProjectTextStyles.appbarTextStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: ProjectUtilityColors.grey,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CalculatorBloc, CalculatorState>(
              buildWhen: (previous, current) =>
                  current is! CalculatorActionState,
              bloc: _bloc,
              builder: (context, state) {
                if (state is CalculatorResultState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.previousInput,
                        style: ProjectTextStyles.appbarTextStyle,
                      ),
                      ResultArea(result: state.result),
                    ],
                  );
                }

                return Container();
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                    text: _sil,
                    width: 150,
                    onPressed: () {
                      _bloc.add(CalculatorDeletePressedEvent());
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: _temizle,
                    onPressed: () {
                      _bloc.add(CalculatorClearPressedEvent());
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: OperatorEnum.division.toUIString,
                    onPressed: () {
                      _bloc.add(
                        CalculatorOperationPressedEvent(OperatorEnum.division),
                      );
                    }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                    text: NumberEnum.seven.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.seven.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: NumberEnum.eight.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.eight.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: NumberEnum.nine.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.nine.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: OperatorEnum.multiplication.toUIString,
                    onPressed: () {
                      _bloc.add(CalculatorOperationPressedEvent(
                          OperatorEnum.multiplication));
                    }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                    text: NumberEnum.four.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.four.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: NumberEnum.five.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.five.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: NumberEnum.six.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.six.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: OperatorEnum.subtraction.toUIString,
                    onPressed: () {
                      _bloc.add(CalculatorOperationPressedEvent(
                          OperatorEnum.subtraction));
                    }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                    text: NumberEnum.one.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.one.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: NumberEnum.two.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.two.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: NumberEnum.three.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.three.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: OperatorEnum.addition.toUIString,
                    onPressed: () {
                      _bloc.add(CalculatorOperationPressedEvent(
                          OperatorEnum.addition));
                    }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                    width: 150,
                    text: NumberEnum.zero.index.toString(),
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent(
                          NumberEnum.zero.index.toString()));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: '.',
                    onPressed: () {
                      _bloc.add(CalculatorNumberPressedEvent('.'));
                    }),
                const SizedBox(width: 10),
                CalculatorButton(
                    text: OperatorEnum.equal.toUIString,
                    onPressed: () {
                      _bloc.add(CalculatorEqualPressedEvent());
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

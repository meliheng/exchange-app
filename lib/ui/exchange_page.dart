import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pgproject/bloc/exchange_bloc.dart';
import 'package:pgproject/ui/widgets/currency_selection_dropdown.dart';
import 'package:pgproject/ui/widgets/currency_value_input_area.dart';
import 'package:pgproject/utility/exchange_style_constants.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final String appbarTitle = "KUR ÇEVİRME";
  final String paraBirimi = "PARA BİRİMİ";
  final String miktar = "MİKTAR";
  final ExchangeBloc bloc = ExchangeBloc();
  @override
  void initState() {
    super.initState();
    bloc.add(ExchangeFetchListEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        bloc.add(ExchangeBackButtonClickEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appbarTitle),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: BlocBuilder<ExchangeBloc, ExchangeState>(
            buildWhen: (previous, current) => current is! ExchangeActionState,
            bloc: bloc,
            builder: (context, state) {
              if (state is ExchangeFetchListState) {
                return const CircularProgressIndicator();
              } else if (state is ExchangeInitialState) {
                return _main(state);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _main(ExchangeInitialState state) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: ExchangeStyleConstants.heightSpace20,
          ),
          Text(
            paraBirimi,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: ExchangeStyleConstants.heightSpace20,
          ),
          CurrencySelectionDropdown(bloc: bloc, state: state),
          const SizedBox(
            height: ExchangeStyleConstants.heightSpace20,
          ),
          Text(
            miktar,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: ExchangeStyleConstants.heightSpace20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CurrencyValueInputArea(
                state: state,
                bloc: bloc,
              ),
              const SizedBox(width: 30),
              _totalResult(state),
            ],
          ),
        ],
      ),
    );
  }

  Widget _totalResult(ExchangeInitialState state) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.grey,
      child: Text(state.result.toStringAsFixed(2)),
    );
  }
}

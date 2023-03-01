import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobe_template/features/fruits/presentation/widgets/widgets.dart';
import 'package:jobe_template/service_locator.dart';

import '../bloc/fruits_bloc.dart';

class FruitPage extends StatelessWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit Page! :D'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<FruitsBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<FruitsBloc>()..add(GetAllFruits()),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<FruitsBloc, FruitsState>(builder: (context, state) {
                if (state is Empty) {
                  return const InfoMessage(message: 'Här vart det tomt');
                } else if (state is Loading) {
                  return const LoadingWidget();
                } else if (state is Loaded) {
                  return FruitList(fruits: state.fruits);
                } else if (state is Error) {
                  return InfoMessage(message: state.message);
                }
                return const InfoMessage(
                    message: 'Här har de hänt något konstigt');
              })
            ],
          ),
        ),
      ),
    );
  }
}

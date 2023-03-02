import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobe_template/features/fruits/presentation/bloc/fruit_detail_bloc.dart';
import 'package:jobe_template/features/fruits/presentation/widgets/widgets.dart';
import 'package:jobe_template/service_locator.dart';

import '../../../../shared/shared.dart';

class FruitDetailPage extends StatelessWidget {
  const FruitDetailPage({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit Detail'),
      ),
      body: KeyboardUnfocus(
        child: SingleChildScrollView(
          child: buildBody(context),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FruitDetailBloc>(
          create: (_) => sl<FruitDetailBloc>()..add(GetFruitByName(slug)),
        ),
      ],
      child: Center(
        child: BlocBuilder<FruitDetailBloc, FruitDetailState>(
            builder: (context, state) {
          return Column(
            children: [
              AutoCompleteSearchTextField(
                hintText:
                    BlocProvider.of<FruitDetailBloc>(context).getHintText(),
                onChanged: (String name) =>
                    BlocProvider.of<FruitDetailBloc>(context).add(
                  SearchFruitByName(name),
                ),
                items: const [
                  'Apple',
                  'Banana',
                  'Blueberry',
                  'Cherry',
                  'Cranberry',
                  'Dragonfruit',
                  'Durian',
                  'Avocado',
                  'Blackberry',
                  'Apricot'
                ],
              ),
              if (state is Empty)
                const InfoMessage(message: 'Här vart det tomt'),
              if (state is Loading) const LoadingWidget(),
              if (state is Loaded) FruitInfo(fruit: state.fruit),
              if (state is Error) InfoMessage(message: state.message),
            ],
          );
        }),
      ),
    );
  }
}

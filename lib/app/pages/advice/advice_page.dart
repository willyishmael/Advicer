import 'package:advicer/app/core/services/theme_service.dart';
import 'package:advicer/app/pages/advice/cubit/advice_cubit.dart';
import 'package:advicer/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicePageProvider extends StatelessWidget {
  const AdvicePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final injector = Injector();
    return BlocProvider(
      create: (context) => injector.sl<AdviceCubit>(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: theme.textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdviceCubit, AdviceCubitState>(
                  builder: (context, state) {
                    if (state is AdviceCubitInitialState) {
                      return Text(
                        'Your Advice is waiting for you!',
                        style: theme.textTheme.headlineMedium,
                      );
                    } else if (state is AdviceCubitLoadingState) {
                      return CircularProgressIndicator(
                        color: theme.colorScheme.secondary,
                      );
                    } else if (state is AdviceCubitLoadedState) {
                      return Text(state.advice);
                    } else if (state is AdviceCubitErrorState) {
                      return Text(state.message);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => BlocProvider.of<AdviceCubit>(context)
                      .adviceRequestEvent(),
                  child: const Text('Get Advice'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

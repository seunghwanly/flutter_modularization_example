import 'package:counter_screen/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:l3_feature/l3_feature.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COUNTER'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: Text(
                    '$state',
                    key: ValueKey<int>(state),
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Press floating button to control the count'),
            ],
          ),

          /// Buttons
          Align(
            alignment: const Alignment(0, 0.5),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed:
                          BlocProvider.of<CounterCubit>(context).increase,
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed:
                          BlocProvider.of<CounterCubit>(context).decrease,
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

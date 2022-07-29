import 'package:animated_floating_action_button/extension_methods.dart';
import 'package:animated_floating_action_button/features/home/widgets/animated_fab.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.backgroundColor,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 40, right: 40),
                child: Column(
                  children: [
                    Text(
                      'Main Home Page',
                      style: TextStyle(
                        fontSize: 32,
                        color: colorScheme.tertiaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white.withOpacity(0.65),
                      ),
                      child: Text(
                        'Animated Floating Action Button',
                        style: TextStyle(color: colorScheme.tertiaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const AnimatedFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

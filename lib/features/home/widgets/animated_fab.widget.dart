import 'package:animated_floating_action_button/extension_methods.dart';
import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  const AnimatedFab({Key? key}) : super(key: key);

  @override
  State<AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late final AnimationController _animationController;
  late final Animation<double> _translateButton;

  @override
  initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _translateButton = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _toggleAnimation() {
    _isExpanded
        ? _animationController.reverse()
        : _animationController.forward();

    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.5, left: 5),
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Stack(
                children: [
                  floatingChildButton(
                    bgColor: colorScheme.secondaryColor,
                    iconColor: colorScheme.tertiaryColor,
                    icon: Icons.offline_bolt_outlined,
                    heroTag: 2,
                    iconSpacing: 1.6,
                  ),
                  floatingChildButton(
                    bgColor: colorScheme.secondaryColor,
                    iconColor: colorScheme.tertiaryColor,
                    icon: Icons.person_outline_outlined,
                    heroTag: 3,
                    iconSpacing: 3,
                  ),
                  floatingChildButton(
                    bgColor: colorScheme.secondaryColor,
                    iconColor: colorScheme.tertiaryColor,
                    icon: Icons.add,
                    heroTag: 4,
                    iconSpacing: 4.4,
                  ),
                  SizedBox(
                    height: 62.5,
                    width: 62.5,
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.25)
                          .animate(_animationController),
                      child: FloatingActionButton(
                        heroTag: 1,
                        backgroundColor: colorScheme.primaryColor,
                        onPressed: _toggleAnimation,
                        child: const Icon(
                          Icons.home_outlined,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget floatingChildButton({
    required Color bgColor,
    required Color iconColor,
    required Object heroTag,
    required IconData icon,
    required double iconSpacing,
    void Function()? onPressed,
  }) {
    return Positioned(
      top: 0,
      bottom: 0,
      child: Transform(
        transform: Matrix4.translationValues(
          _translateButton.value * iconSpacing,
          0.0,
          0.0,
        )
          ..translate(56 / 2, 56 / 2)
          ..scale(_translateButton.value * 0.02)
          ..translate(-56 / 2, -56 / 2),
        child: FloatingActionButton(
          heroTag: heroTag,
          backgroundColor: bgColor,
          onPressed: onPressed,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

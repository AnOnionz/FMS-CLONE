import 'package:flutter/material.dart';

import '/core/mixins/fx.dart';
import 'animated_button.dart';

class ScrollToTopButton extends StatelessWidget {
  final ScrollController scrollController;

  const ScrollToTopButton({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: 100.milliseconds,
      opacity: scrollController.offset > 100 ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Tooltip(
          message: 'Scroll to top',
          preferBelow: false,
          child: AnimatedButton(
            onPressed: () => scrollController.animateTo(
              0.0,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 500),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: const Icon(Icons.keyboard_double_arrow_up_rounded),
          ),
        ),
      ),
    );
  }
}

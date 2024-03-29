import 'package:flutter/material.dart';
import 'package:wordle_app/app/core/consts/qwerty.dart';
import 'package:wordle_app/app/wordle/wordle.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) onKeyTapped;
  final VoidCallback onDeleteTapped;
  final VoidCallback onEnterTapped;
  final Set<Letter> letters;

  const Keyboard({
    super.key,
    required this.onKeyTapped,
    required this.onDeleteTapped,
    required this.onEnterTapped,
    required this.letters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: qwerty
          .map(
            (keyRow) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: keyRow.map((letter) {
                if (letter == 'DEL') {
                  return _KeyboardButton.delete(ontap: onDeleteTapped);
                } else if (letter == 'ENTER') {
                  return _KeyboardButton.enter(ontap: onEnterTapped);
                }

                final letterKey = letters.firstWhere(
                  (e) => e.val == letter,
                  orElse: () => Letter.empty(),
                );

                return _KeyboardButton(
                  letter: letter,
                  onTap: () => onKeyTapped(letter),
                  backgroundColor: letterKey != Letter.empty()
                      ? letterKey.backgroundColor
                      : Colors.grey,
                );
              }).toList(),
            ),
          )
          .toList(),
    );
  }
}

class _KeyboardButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color backgroundColor;
  final String letter;

  const _KeyboardButton({
    super.key,
    this.height = 48,
    this.width = 30,
    required this.onTap,
    required this.backgroundColor,
    required this.letter,
  });

  factory _KeyboardButton.delete({
    required VoidCallback ontap,
  }) {
    return _KeyboardButton(
      width: 56,
      onTap: ontap,
      backgroundColor: Colors.grey,
      letter: 'DEL',
    );
  }
  factory _KeyboardButton.enter({
    required VoidCallback ontap,
  }) {
    return _KeyboardButton(
      width: 56,
      onTap: ontap,
      backgroundColor: Colors.grey,
      letter: 'ENTER',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              child: Text(
                letter,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ));
  }
}

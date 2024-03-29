import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordle_app/app/core/consts/colors.dart';


enum LetterStatus {
  initial,
  notInWord,
  inWord,
  correct,
}

class Letter extends Equatable {
  final String val;
  final LetterStatus status;

  const Letter({required this.val, this.status = LetterStatus.initial});

  factory Letter.empty() => const Letter(val: '');

  @override
  List<Object?> get props => [val, status];

  Letter copyWith({
    String? val,
    LetterStatus? status,
  }) {
    return Letter(
      val: val ?? this.val,
      status: status ?? this.status,
    );
  }

  Color get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.transparent;
      case LetterStatus.notInWord:
        return CustomColors.black3a3a3c;
      case LetterStatus.inWord:
        return CustomColors.yellowB49F3A;
      case LetterStatus.correct:
        return CustomColors.green538D4E;
    }
  }

  Color get borderColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }
}

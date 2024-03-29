import 'package:equatable/equatable.dart';
import 'package:wordle_app/app/wordle/wordle.dart';

class Word extends Equatable {
  final List<Letter> letters;
  const Word({required this.letters});

  @override
  List<Object?> get props => [letters];

  factory Word.fromString(String word) {
    return Word(
      letters: word.split('').map((e) => Letter(val: e)).toList(),
    );
  }

  String get wordString => letters.map((e) => e.val).join();

  void addLetter(String value) {
    final currentIndex = letters.indexWhere((e) => e.val.isEmpty);
    if (currentIndex != -1) {
      letters[currentIndex] = Letter(val: value);
    }
  }

  void removeLetter() {
    final recentLetterIndex = letters.lastIndexWhere((e) => e.val.isNotEmpty);
    if (recentLetterIndex != -1) {
      letters[recentLetterIndex] = Letter.empty()
      ;
    }
  }
}

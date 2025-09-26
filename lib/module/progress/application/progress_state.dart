part of 'progress_bloc.dart';

@freezed
class ProgressState with _$ProgressState {
  const factory ProgressState({
    required List<Letter> letters,
    required List<Number> numbers,
    required List<Thing> things,
    required List<WordSelection> wordSelections,
    required List<WordMatch> wordMatches,
    required List<UserProgress> userProgresses,
    required bool isLoading,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _ProgressState;

  int compareWriteAt(UserProgress a, UserProgress b) {
    if (a.writeAt == null && b.writeAt == null) return 0;
    if (a.writeAt == null) return 1; // nulls go last
    if (b.writeAt == null) return -1;
    return b.writeAt!.compareTo(a.writeAt!);
  }

  // letter
  List<UserProgress> get letterProgresses =>
      userProgresses
          .where((progress) => progress.exerciseType == ExerciseType.letter)
          .toList()
        ..sort(compareWriteAt);

  Letter? get lastLearnedLetter {
    if (letterProgresses.isEmpty || letters.isEmpty) return null;
    UserProgress lastLearnedProgress = letterProgresses.first;
    return letters.firstWhereOrNull(
      (letter) => letter.id == lastLearnedProgress.id,
    );
  }

  Letter? get nextLearnedLetter {
    if (lastLearnedLetter == null) return null;
    int nextOrder = lastLearnedLetter!.order + 1;
    return letters.firstWhereOrNull((letter) => letter.order == nextOrder);
  }

  // number
  List<UserProgress> get numberProgresses =>
      userProgresses
          .where((progress) => progress.exerciseType == ExerciseType.number)
          .toList()
        ..sort(compareWriteAt);

  Number? get lastLearnedNumber {
    if (numberProgresses.isEmpty || numbers.isEmpty) return null;
    UserProgress lastLearnedProgress = numberProgresses.first;
    return numbers.firstWhereOrNull(
      (number) => number.id == lastLearnedProgress.id,
    );
  }

  Number? get nextLearnedNumber {
    if (lastLearnedNumber == null) return null;
    int nextOrder = int.tryParse(lastLearnedNumber!.title)! + 1;
    return numbers.firstWhereOrNull(
      (number) => int.tryParse(number.title) == nextOrder,
    );
  }

  // things
  List<UserProgress> get thingProgresses =>
      userProgresses
          .where((progress) => progress.exerciseType == ExerciseType.things)
          .toList()
        ..sort(compareWriteAt);

  Thing? get lastLearnedThing {
    if (thingProgresses.isEmpty || things.isEmpty) return null;
    UserProgress lastLearnedProgress = thingProgresses.first;
    return things.firstWhereOrNull(
      (thing) => thing.id == lastLearnedProgress.id,
    );
  }

  Thing? get nextLearnedThing {
    if (lastLearnedThing == null) return null;
    int nextOrder = lastLearnedThing!.order + 1;
    return things.firstWhereOrNull((thing) => thing.order == nextOrder);
  }

  // word selection
  List<UserProgress> get wordSelectionProgresses =>
      userProgresses
          .where(
            (progress) => progress.exerciseType == ExerciseType.wordSelection,
          )
          .toList()
        ..sort(compareWriteAt);

  WordSelection? get lastLearnedWordSelection {
    if (wordSelectionProgresses.isEmpty || wordSelections.isEmpty) return null;
    UserProgress lastLearnedProgress = wordSelectionProgresses.first;
    return wordSelections.firstWhereOrNull(
      (word) => word.id == lastLearnedProgress.id,
    );
  }

  WordSelection? get nextLearnedWordSelection {
    if (lastLearnedWordSelection == null) return null;
    int nextOrder = lastLearnedWordSelection!.order + 1;
    return wordSelections.firstWhereOrNull((thing) => thing.order == nextOrder);
  }

  // word match
  List<UserProgress> get wordMatchProgresses =>
      userProgresses
          .where((progress) => progress.exerciseType == ExerciseType.wordMatch)
          .toList()
        ..sort(compareWriteAt);

  WordMatch? get lastLearnedWordMatch {
    if (wordMatchProgresses.isEmpty || wordMatches.isEmpty) return null;
    UserProgress lastLearnedProgress = wordMatchProgresses.first;
    return wordMatches.firstWhereOrNull(
      (word) => word.id == lastLearnedProgress.id,
    );
  }

  WordMatch? get nextLearnedWordMatch {
    if (lastLearnedWordMatch == null) return null;
    int nextOrder = lastLearnedWordMatch!.order + 1;
    return wordMatches.firstWhereOrNull((word) => word.order == nextOrder);
  }

  int get totalWordNSentenceProgress =>
      wordSelectionProgresses.length + wordMatchProgresses.length;

  factory ProgressState.initial() => ProgressState(
    letters: [],
    numbers: [],
    things: [],
    wordSelections: [],
    wordMatches: [],
    userProgresses: [],
    isLoading: true,
    fetchFailure: none(),
  );

  const ProgressState._();
}

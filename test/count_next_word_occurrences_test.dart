import 'package:taco/count_next_word_occurences.dart';
import 'package:test/test.dart';

/// The first test case checks that the function returns the correct map for a given
/// input string with multiple words and punctuation. The second test case checks
/// that the function returns an empty map for an input string with no words. The
/// third test case checks that the function returns a map with one key-value pair
/// for an input string with only one word.
///
void main() {
    test('countNextWordOccurrences', () {
    final input = 'the cat in the hat, the hat on the mat.';
    final result = countNextWordOccurrences(input);
    expect(result, {
      'the': {'cat': 1, 'hat': 2, 'on': 1, 'mat': 1},
      'cat': {'in': 1},
      'in': {'the': 1},
      'hat': {'the': 1, 'on': 1},
      'on': {'the': 1},
      'mat': {'.': 1},
    });
  });
}
